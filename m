Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2CBC98321
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 19:39:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xABl0-0004Jl-8Z; Fri, 25 Sep 2026 15:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xABkx-0004Ii-T1
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 15:38:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xABkv-0001oY-9d
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 15:38:51 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PIo6Zm2889697
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 19:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9oILPz+ZbtO/SVpKilKXfofExYHT/pJhV3tTC+KJ4R8=; b=pseWw5CXzLQGtnpg
 BdjbgnnxleEkhsW+WIYWhO+NWrTawe1uunBALSb6g1CgliIr/9tTsighKLuJezJ4
 g6WIOKIRG/vrpI+0/EvGyTH5nc+HTsn/B8iVMHIpb0PEBOkOQDgl8Qv2bOpxT7Mr
 bLJtkoW8lmOSN9CSdnCmHSeac7R84+Krk+rFfADVSEIPhRH9/RIZ0I65cyFqnQi/
 c6gtBWgaczvCLyJ1fJta9y2AQmey4rgFGmJl6Xb6WbUdlYXMkZXtX7SlTtZQosAJ
 N+WqzaJipyw3jDqTH4rXQJr/I6HaKCvnv8UiuM5KNLkK+WzAbMdousFDOu+XHsyh
 Q7gfbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwwjc8ghf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 19:38:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93bfb2da664so342757885a.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790365124; x=1790969924; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9oILPz+ZbtO/SVpKilKXfofExYHT/pJhV3tTC+KJ4R8=;
 b=G7gp1UZ45KZlZxI3jJ6pLLqaNg6KoDVt1Hw4uJJOlew8Q4pBXEmmw2PsLSPAlhiDbv
 sZWtmKabqDf94i+4xZdNR/Gra+XrJ8SOvQkeXGSFBtRXDqOrQN4pdcvtmpMa6eIpNOA5
 cj4uuKJtT7/igEkxneCM3XtFK5CjCagp23SgXoWQ36dpABicGJoHNv4b2FjfQfLaIH2q
 haHeOaAFDx//IR0YVoiTbZKVwRQCpKJN/ETKKsoLmLhubNXdUf/rQG9AA2IalT5xTDrV
 yY8nT6t6eFQsglq7x8+pHNgD37GlwGHlZaodNNSzL9rvelSrRPjoL7oJ8/pc5Deje1ol
 plfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790365124; x=1790969924;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9oILPz+ZbtO/SVpKilKXfofExYHT/pJhV3tTC+KJ4R8=;
 b=KVOHRZK1KNANb1U9udFwMi8+cAbqvIxbXL4EnJtulNoohSELsdLwLoiOfPTG9gTUNW
 UL3FLu5S2FUatvbvKrwf2RRZuhDMMLpch5JPodNkNMs5EaDkoM8sFnrRI2AHaFCH8Tmm
 EUeCzz6UVhH6PnXNNst744GRyGQvbeSfG/jx//MIUnN+FM+Co5xO1YmExiAWBRy5D52h
 nLVehc7STtUSF+VJ3fZrOySR5cJflL97sVo5QRvuNb6+CQ2xSlPFafhk7gcreoVJ7T0X
 l/NKWps4Z50C59M+ltQoTzKOD6ZDLtxKfUATtK9vlU6B7tqAgxNw/pJeDWUbYtJ1n8Z6
 hJLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz77Fz9ZuYe+1xb0zfFtcZgB3oUA02UI0BVLur+WYIguJMsFW93vcCsoqE+XD6Pd3UylxOUQi28z56Q@nongnu.org
X-Gm-Message-State: AFuF++lOOrDuoNbXdF03raHSKTeceHhki78BrFoxq50sOLlyKnfLRRwp
 7djQbGmJj97RiORnw+JtlZwxTvQ8EBldMnqYEIWFpKQoA5c8nVMWZAb8m30w5AdHHPRGPM++iq8
 37Vpc39UE1aCuA0FA/r3ZKC0rAofsAP7Y0Jx7mzm6qMRbBq7c9CzeheqfNA==
X-Gm-Gg: AYBFou0n2Mv5mNWbPFyzqF0vaq19DChCp70rV9VolkXerxPweCZjlTHtANvm8NacL0r
 ydsM4v/eZsYu5ZNqcUzB8lFTR7t3acmo1p8QAo7ie8GRH+gSo3+uBbrlcbdGwrQaLwCIS2Y5GxU
 68kYdLaOYrP+pTbcJtXzr5r5Wn1B638eGuSuP0Vgtr++J0NReOXChusgkws4agPET3WhZy3Beaw
 tBRc9+1DZDmS8wgLQPOaPPhJhipB36qqB5LJK8Y6fXIpgd9HjDh+8vu06BHIoxKTrjzkaBphvjL
 g0lOHlD8ClyyDZz9nt3vP1DTP6NI0ro8GcfQj+ORnb97mGKrAR6kaGRNmiqCELXnIsNBAqeInc/
 Iui1czGre92QSO5tFtpjVKsCK4KEwwSuKqw==
X-Received: by 2002:a05:620a:4809:b0:939:6dee:4b09 with SMTP id
 af79cd13be357-93c475129d8mr533562985a.51.1790365124109; 
 Fri, 25 Sep 2026 12:38:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4809:b0:939:6dee:4b09 with SMTP id
 af79cd13be357-93c475129d8mr533558985a.51.1790365123511; 
 Fri, 25 Sep 2026 12:38:43 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c44972febsm255429585a.39.2026.09.25.12.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 12:38:42 -0700 (PDT)
Message-ID: <797fa41f-4f74-4228-ac9e-26955b0b32d2@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:38:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm: Use the host AIA MSI ID limit
To: Qingwei Hu <qingwei.hu@bytedance.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, yongxuan.wang@sifive.com
References: <20260922122215.1619439-1-qingwei.hu@bytedance.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922122215.1619439-1-qingwei.hu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3OCBTYWx0ZWRfX3bY7o79iTzRQ
 SueCjk3qxyK/zbSe9LER6VHicpyudnGWLQAeDJUbDYCXAtGgC+4Quu7GjMKvhT4DqLhc0RPkTOv
 eSuHlT03ZqaQnZsZ56njE/0Pr9O7ez4=
X-Authority-Analysis: v=2.4 cv=dZwVTnXe c=1 sm=1 tr=0 ts=6ab6cdc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=968KyxNXAAAA:8 a=cbWReDcVF8Dxy-93n-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3OCBTYWx0ZWRfX04/P0/PsZRYs
 G5zIdasQvlgfdOhrhKS+loBGcbXDXlFhiIj12GmeocLq6lzAopC1UXZZ+jfjEx8EcvDmyKn8nYE
 Ie/FMRA6wC3suhvlY+vQK1Artlq6fyy/nArWWuAqs97G3tseHboRzJm5FJVOWKGs5TBQrmMD/wl
 tz+zPDBlsqXSzy74Sp5KWtVsaZotsYvGy79C57GrjAaPKOjNrwuHbb0+vh04a1zieyYZanVCw4k
 U2XCpPC7aIqKqS+93Qyf3agH5T8t2YJ0gpeJ60KD1pGRvP3JC/v/uZ48vQSxIJIqTecS4kewlvO
 KVy9TW0+dmhJqIksIrpqP6hGzFtPbzra7hJeFypzRZnSYXm8Tvd2PHwMQJ97HwcqCd2+pwz+FjQ
 hS746nEj63uVJH6Mk5blg4jMBWbKlsOS/Zmmtuj+H2z7yDnjIMDQtSUwbVZAOKAv0UcoJh57c35
 oEKG0JbYY4jpwTU9uBQ==
X-Proofpoint-GUID: yGFFb2dkbSG7_3Ldfw15K1uEZnYXr1xS
X-Proofpoint-ORIG-GUID: yGFFb2dkbSG7_3Ldfw15K1uEZnYXr1xS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hello,

If we try to build this patch in a non-KVM enviroment we'll have this error:

FAILED: libstubs_riscv.a.p/target_riscv_kvm_kvm-stub.c.o
cc -m64 -Ilibstubs_riscv.a.p -I. -I.. -I../common-user/host/x86_64 -I../linux-user/include/host/x86_64 -I../linux-user/include -Itarget/riscv -I../target/riscv -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O0 -g -mcx16 -msse2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -ftrivial-auto-var-init=zero 
-fzero-call-used-regs=used-gpr -fstack-protector-strong -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-overflow=2 -Wformat-security -Wformat-y2k -Wignored-qualifiers -Wimplicit-fallthrough=2 -Winit-self -Wmissing-format-attribute -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -Wshadow=local -Wstrict-prototypes -Wtype-limits -Wundef -Wvla -Wwrite-strings -Wno-missing-include-dirs -Wno-psabi -Wno-shift-negative-value -isystem 
/local/mnt/workspace/qemu/linux-headers -isystem linux-headers -iquote . -iquote /local/mnt/workspace/qemu -iquote /local/mnt/workspace/qemu/include -iquote /local/mnt/workspace/qemu/host/include/x86_64 -iquote /local/mnt/workspace/qemu/host/include/generic -iquote /local/mnt/workspace/qemu/tcg/x86_64 -pthread -fPIE -DCPU_DEFS_H -DCOMPILING_SYSTEM_VS_USER -DCONFIG_SOFTMMU -MD -MQ libstubs_riscv.a.p/target_riscv_kvm_kvm-stub.c.o -MF libstubs_riscv.a.p/target_riscv_kvm_kvm-stub.c.o.d -o 
libstubs_riscv.a.p/target_riscv_kvm_kvm-stub.c.o -c ../target/riscv/kvm/kvm-stub.c
../target/riscv/kvm/kvm-stub.c:12:6: error: conflicting types for ‘kvm_riscv_aia_create’; have ‘void(MachineState *, uint64_t,  uint64_t,  uint64_t,  uint64_t,  uint64_t,  uint64_t)’ {aka ‘void(MachineState *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)’}
    12 | void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
       |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../target/riscv/kvm/kvm-stub.c:10:
/local/mnt/workspace/qemu/target/riscv/kvm/kvm_riscv.h:26:5: note: previous declaration of ‘kvm_riscv_aia_create’ with type
  int(uint64_t,  uint32_t *)’ {aka ‘int(long unsigned int,  unsigned int *)’}
    26 | int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num);
       |     ^~~~~~~~~~~~~~~~~~~~
[1958/3154] Compiling C object libqemu-riscv64-softmmu.a.p/target_riscv_tcg_debug.c.o


The reason is, down there ...


On 9/22/2026 9:22 AM, Qingwei Hu wrote:
> KVM initializes CONFIG_IDS to the number of guest MSI IDs supported by
> the host. The virt machine currently overwrites it with the fixed
> VIRT_IRQCHIP_NUM_MSIS value of 255, which can be inconsistent with the
> host-supported guest MSI ID count.
> 
> Create the KVM AIA device before realizing the per-socket IMSICs and
> read the host-provided CONFIG_IDS value. Use it to configure the QEMU
> IMSIC devices and the guest-visible DT and ACPI descriptions. Complete
> the remaining KVM AIA setup after all vCPUs have been created, as the
> IMSIC address configuration depends on them.
> 
> Keep VIRT_IRQCHIP_NUM_MSIS as the default for non-KVM machines.
> 
> Fixes: 9634ef7eda5f ("target/riscv: Create an KVM AIA irqchip")
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>   hw/riscv/virt-acpi-build.c   |  4 +--
>   hw/riscv/virt.c              | 28 ++++++++++++-----
>   include/hw/riscv/virt.h      |  1 +
>   target/riscv/kvm/kvm-cpu.c   | 59 +++++++++++++++++++++++-------------
>   target/riscv/kvm/kvm_riscv.h |  9 +++---
>   5 files changed, 66 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8e516ec114..0ebfa10a02 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -576,9 +576,9 @@ static void build_madt(GArray *table_data,
>           build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
>           build_append_int_noprefix(table_data, 0, 4);        /* Flags */
>           /* Number of supervisor mode Interrupt Identities */
> -        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        build_append_int_noprefix(table_data, s->num_msis, 2);
>           /* Number of guest mode Interrupt Identities */
> -        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        build_append_int_noprefix(table_data, s->num_msis, 2);
>           /* Guest Index Bits */
>           build_append_int_noprefix(table_data, guest_index_bits, 1);
>           /* Hart Index Bits */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d4b501802f..ba0e74ce83 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -277,7 +277,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
>               .imsic_m_base = !kvm_enabled() ? s->memmap[VIRT_IMSIC_M].base : 0,
>               .imsic_s_base = s->memmap[VIRT_IMSIC_S].base,
>               .imsic_group_max_size = VIRT_IMSIC_GROUP_MAX_SIZE,
> -            .irqchip_num_msis = VIRT_IRQCHIP_NUM_MSIS,
> +            .irqchip_num_msis = s->num_msis,
>               .aia_guests = s->aia_guests
>           };
>   
> @@ -718,6 +718,7 @@ static void virt_machine_init(MachineState *machine)
>       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>       int i, base_hartid, hart_count;
>       int socket_count = riscv_socket_count(machine);
> +    int aia_fd = -1;
>   
>       s->memmap = virt_memmap;
>   
> @@ -733,6 +734,16 @@ static void virt_machine_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    /*
> +     * Create the KVM AIA device and query the host MSI ID count before
> +     * realizing the per-socket IMSICs. Complete AIA initialization after
> +     * all vCPUs have been created.
> +     */
> +    if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
> +        aia_fd = kvm_riscv_aia_create(VIRT_IRQCHIP_NUM_SOURCES,
> +                                      &s->num_msis);
> +    }
> +
>       /* Initialize sockets */
>       mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
>       for (i = 0; i < socket_count; i++) {
> @@ -826,7 +837,7 @@ static void virt_machine_init(MachineState *machine)
>                                                &s->memmap[VIRT_IMSIC_M],
>                                                &s->memmap[VIRT_IMSIC_S],
>                                                i, base_hartid, hart_count,
> -                                             VIRT_IRQCHIP_NUM_MSIS,
> +                                             s->num_msis,
>                                                VIRT_IRQCHIP_NUM_PRIO_BITS);
>           }
>   
> @@ -845,12 +856,12 @@ static void virt_machine_init(MachineState *machine)
>           }
>       }
>   
> -    if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
> -        kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
> -                             VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
> -                             s->memmap[VIRT_APLIC_S].base,
> -                             s->memmap[VIRT_IMSIC_S].base,
> -                             s->aia_guests);

This call of kvm_riscv_aia_create(), even when guarded with a kvm_enabled(), needs to be
visible to the compiler in a TCG only build.  We have a kvm-stub.c file that declares it
like so:

void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
                           uint64_t aplic_base, uint64_t imsic_base,
                           uint64_t guest_num)
{
     g_assert_not_reached();
}

Thus changing kvm_riscv_aia_create() requires a change in its kvm-stub as well.

> +    if (aia_fd >= 0) {
> +        kvm_riscv_aia_init(machine, aia_fd, IMSIC_MMIO_GROUP_MIN_SHIFT,
> +                           VIRT_IRQCHIP_NUM_SOURCES,
> +                           s->memmap[VIRT_APLIC_S].base,
> +                           s->memmap[VIRT_IMSIC_S].base,
> +                           s->aia_guests);
>       }

And a similar thing is needed here for kvm_riscv_aia_init(). We need a kvm-stub entry and it
needs to be guarded with kvm_enabled() as well.

We need something like this diff:

$ git diff
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ba0e74ce83..4df8d7d441 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -856,7 +856,7 @@ static void virt_machine_init(MachineState *machine)
          }
      }

-    if (aia_fd >= 0) {
+    if (kvm_enabled() && aia_fd >= 0) {
          kvm_riscv_aia_init(machine, aia_fd, IMSIC_MMIO_GROUP_MIN_SHIFT,
                             VIRT_IRQCHIP_NUM_SOURCES,
                             s->memmap[VIRT_APLIC_S].base,
diff --git a/target/riscv/kvm/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
index 64e39c96d8..b7e6504f5f 100644
--- a/target/riscv/kvm/kvm-stub.c
+++ b/target/riscv/kvm/kvm-stub.c
@@ -9,10 +9,15 @@
  #include "qemu/osdep.h"
  #include "target/riscv/kvm/kvm_riscv.h"

-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num)
+int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num)
+{
+    g_assert_not_reached();
+}
+
+void kvm_riscv_aia_init(MachineState *machine, int aia_fd,
+                        uint64_t group_shift, uint64_t aia_irq_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num)
  {
      g_assert_not_reached();
  }


Code LGTM otherwise.  Booted a KVM aia guest and play with it a little bit
without any hicups.


Thanks,
Daniel
  >
>       if (riscv_is_32bit(&s->soc[0])) {
> @@ -972,6 +983,7 @@ static void virt_machine_instance_init(Object *obj)
>       s->acpi = ON_OFF_AUTO_AUTO;
>       s->iommu_sys = ON_OFF_AUTO_AUTO;
>       s->num_sources = VIRT_IRQCHIP_NUM_SOURCES;
> +    s->num_msis = VIRT_IRQCHIP_NUM_MSIS;
>   }
>   
>   static char *virt_get_aia_guests(Object *obj, Error **errp)
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e516898f9a..f64a2a3448 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -66,6 +66,7 @@ struct RISCVVirtState {
>       OnOffAuto iommu_sys;
>       uint16_t pci_iommu_bdf;
>       uint16_t num_sources;
> +    uint32_t num_msis;
>   };
>   
>   enum {
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 68e1501b21..02af4e7723 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1859,19 +1859,11 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>                                       "auto");
>   }
>   
> -void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> -                          uint64_t aia_irq_num, uint64_t aia_msi_num,
> -                          uint64_t aplic_base, uint64_t imsic_base,
> -                          uint64_t guest_num)
> +int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num)
>   {
> -    int ret, i;
> -    int aia_fd = -1;
> +    int ret;
> +    int aia_fd;
>       uint64_t default_aia_mode;
> -    uint64_t socket_count = riscv_socket_count(machine);
> -    uint64_t max_hart_per_socket = 0;
> -    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
> -    uint64_t socket_bits, hart_bits, guest_bits;
> -    uint64_t max_group_id;
>   
>       aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
>   
> @@ -1903,6 +1895,41 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>           }
>       }
>   
> +    /*
> +     * Get the maximum MSI ID supported by the host from the CONFIG_IDS
> +     * attribute and use it for the guest-visible interrupt controller
> +     * configuration.
> +     */
> +    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> +                            aia_msi_num, false, NULL);
> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to get number of MSI IDs");
> +        exit(1);
> +    }
> +
> +    if (!kvm_kernel_irqchip_split() && *aia_msi_num < aia_irq_num) {
> +        error_report("KVM AIA: host supports only %" PRIu32 " MSI IDs, "
> +                     "but the virt machine requires at least %" PRIu64,
> +                     *aia_msi_num, aia_irq_num);
> +        exit(1);
> +    }
> +
> +    return aia_fd;
> +}
> +
> +void kvm_riscv_aia_init(MachineState *machine, int aia_fd,
> +                        uint64_t group_shift, uint64_t aia_irq_num,
> +                        uint64_t aplic_base, uint64_t imsic_base,
> +                        uint64_t guest_num)
> +{
> +    int ret, i;
> +    uint64_t socket_count = riscv_socket_count(machine);
> +    uint64_t max_hart_per_socket = 0;
> +    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
> +    uint64_t socket_bits, hart_bits, guest_bits;
> +    uint64_t max_group_id;
> +
>       /*
>        * Skip APLIC creation in KVM if we're running split mode.
>        * This is done by leaving KVM_DEV_RISCV_AIA_CONFIG_SRCS
> @@ -1927,15 +1954,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>           }
>        }
>   
> -    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> -                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> -                            &aia_msi_num, true, NULL);
> -    if (ret < 0) {
> -        error_report("KVM AIA: failed to set number of msi");
> -        exit(1);
> -    }
> -
> -
>       if (socket_count > 1) {
>           max_group_id = socket_count - 1;
>           socket_bits = find_last_bit(&max_group_id, BITS_PER_LONG) + 1;
> @@ -1987,7 +2005,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>           }
>       }
>   
> -
>       if (max_hart_per_socket > 1) {
>           max_hart_per_socket--;
>           hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index 61eaa12443..1499fb4487 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -23,10 +23,11 @@
>   
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> -void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> -                          uint64_t aia_irq_num, uint64_t aia_msi_num,
> -                          uint64_t aplic_base, uint64_t imsic_base,
> -                          uint64_t guest_num);
> +int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num);
> +void kvm_riscv_aia_init(MachineState *machine, int aia_fd,
> +                        uint64_t group_shift, uint64_t aia_irq_num,
> +                        uint64_t aplic_base, uint64_t imsic_base,
> +                        uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>   bool kvm_riscv_has_mp_state(void);
>   void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);


