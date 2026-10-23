Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83AB606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 18:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmfWbAm1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y4tx52/L
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKKBf-00025O-Ma; Fri, 23 Oct 2026 14:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKBQ-0001wG-4h
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 14:40:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKBO-00079Q-CN
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 14:40:03 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NIZnt23584850
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 18:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R7z0cT5bIIqo/49JO3nou+YQIHlNbtfIEpB5zwgFiRk=; b=YmfWbAm18kXunRfw
 lYGdPLb/Kl1mB3wtwMhTEQM2QFwjaC852E+HFDTDSTf9Xd20lLZ4hNsKOyoDyBJA
 e7cUMC1gNIGWvL2FJjBnTyxMPNl8haO7dCj2YvdvP1LkaMtNx5eWGF5EauqcM40k
 jd8FSifMJnbE8ZeGGDQlJ1WvX3U7BH8/WS2LZz7nr3lrZu9FKluSmzez1GRfqkyJ
 YZ2/NgIRWmphOaF55yWwpJPjq8znJ2C/7H7YhAnbDmACiDbcKOI0TN4Op9uopwL8
 ZIqBYVWIm+9OodjcM6AxL77W53ctgPVV8hL9J1vRIfFOQa+Qa3ZYZQHjNspfes1/
 10wUtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn1efp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 18:39:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f26dd2165so23965685a.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792780799; x=1793385599; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=R7z0cT5bIIqo/49JO3nou+YQIHlNbtfIEpB5zwgFiRk=;
 b=Y4tx52/LZ0STDbbiR/k1YhOdTaKTElQT9s6OnIYDn+ZJD32LVQDqX2IbGJoAjiMz/B
 dl4mcu5FrVxawI/J70nmMtcMPUXXJdb5QdvErwFVRphZeCgSZk1kCqcELFbYnRqIQh0g
 hrN34YbFQSl8OHrVBv1OXk13ZLCT59QSReesZShqzgEC6PzbbgaeQjU3DhrUB7t8ZOCv
 maJPoJQvZ6ohB0OUQ8Gs7dU13ePM3yusNANUlOQ8NJhYoDNh/wQgafzuPOv2ckh8aPGf
 /b9Q6FLHXAHl9eq5G52ptpblSmmytDf2WUJltReKbwGX7n6EJxalFe/gJqYM6tFFKNLO
 IS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792780799; x=1793385599;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R7z0cT5bIIqo/49JO3nou+YQIHlNbtfIEpB5zwgFiRk=;
 b=mn2x6+YPZRUdGFVlq41EhvX8L1zH6RLFKlgtNfZqh5sj2bu2sX+cVuuNjjDW4jh8Mj
 bPFweH6K97d84tN5WHK1wQTCWEMahmgrzFVeAOyEjpAgnf6QNACuAa0ws4p9hxQeApLC
 OamRL6qT/oGCtEwDaubkOhJnkNaFwUx+k5MMaaV9KbKRTHN37FXcdB7V1I/TvrueQdy/
 9J8pwFhZmIRX/npOm251TayxTRhYz6zriV7fxgRkiiyEFb/eFneZC7zNvIV56p1m4dWO
 FpzB1Fcr6iCHlgyhqEtHmmT0JhGfaE5hKqHlhR3sextrZFEctJAzBOcBsFcFAq2Dk3MS
 0JcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwCxdTRFMIRQfDw2W5yyy3mrSPECR/fi11ARSyGk6VG4Ye2BSLzYK0OAFrIYY9vrylCqNsb7mAC+iMl@nongnu.org
X-Gm-Message-State: AFq9FYJwlzNA+mzva06x8WJzR7ld6weUNHLDrfJglMBU+aS2VCYBOBEq
 pHMe3kB/jzVvXz7G9yGBsgOOPgIhUE+wHICWE7G94oT55QCiO8TtDzuDrUlDWdy3cGSyKMZrhhj
 ZM8e9TwLcgH+wd1QXEYZes2g7xjJqIMu+IXFaQqnZYEy5f21TtNFNGQdgTw==
X-Gm-Gg: AYBFou2jyUF46mGrLTAwBId5nzYZ71MXMXrV0Jl6q9b0v2SQI6HBkbZ7hLm+p/fCWce
 zB1RkGDDm8gfL5Woi5zOd3p+QRmTQO5VW0PdRYnRXWsdzpmkT+UbuGQsRA+q9u5l5bdIiO4YrMm
 EH8NgbJ2Jw0Iza6727x58IJHUim24KwJjeN9UnAqGcvHnEe/C/DsIU5pDgxqdX3rixju/IZpiqy
 xQjOhmcdT0VqEAYO9RXHrwry8F5AQ5Bw8w22E5cFRgOBAUtuo+458fdpb/DgRaohW88p1Ok4quW
 5aOk8GHxIv7KpYUt1177mIKI7uj/hVKIV7HbEcHu74/BgbcEoPSCy/CrjdQ6E/0cFqUnAVylwLY
 c/Qk9jm4/UmUUQYMQbIIp/PrR4kBRDAbNsZkS
X-Received: by 2002:a05:620a:284e:b0:93e:5e2c:8bf2 with SMTP id
 af79cd13be357-93f6f91e7damr492764385a.21.1792780798808; 
 Fri, 23 Oct 2026 11:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:284e:b0:93e:5e2c:8bf2 with SMTP id
 af79cd13be357-93f6f91e7damr492761185a.21.1792780798339; 
 Fri, 23 Oct 2026 11:39:58 -0700 (PDT)
Received: from [192.168.68.104] ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9402ee282bcsm87003885a.4.2026.10.23.11.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 11:39:57 -0700 (PDT)
Message-ID: <569240ae-b9b4-4318-b588-97585e0fe015@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:39:54 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] target/riscv: Add SBI STA state to vmstate
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261022022535.437892-1-wang.yechao255@zte.com.cn>
 <20261022022535.437892-4-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022022535.437892-4-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3MyBTYWx0ZWRfX+ZlQFtNyWczh
 a3KPXC1Ru49hMlsee96CXKpHWFx3R+X3g4q9hmTs6V8Ny7HOdyKnadM5n4yDXEUTZi+8CKLvi51
 bKWphETgVE2JFqdthTPdl+IS3v+MZD40iSoCitaz4w/uHrjT6yWWYv5yggoHha5TXB9ZJEp8lkq
 RG8vfvf4oohBPzlg6U+F9qb22sP/ygvqxOqw/ssQD61lOqRz1EdsH7qI0FGP8Y/5ZahfYn2pPED
 0OAanr1oZOzjRIP/uYqWqJVQPGBdoa6qNN9/m/dXcl/pNX84apWYvyFm0tntvlfzQIUpPE9Gwor
 AfwT62BLgTy0cKxQFudqRzfyTDPzettvVOVS1ARyEGrFyAIPsdgEIS4khuC9iyR0DlndJpu9Bd9
 0fmfb2vvAbRc4DynQbwAhtneVCi/K4m8tkLJG8rioEuk78ztvVGcSHmP1M/OupD5kFEHoMp1ZC6
 dAaw4lwdmHz/PHoYXDQ==
X-Proofpoint-GUID: UqS4SyUBFWUk-3fPKLUxrPcHSyE4p85Z
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adba9ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=mOLHsHEe2ig5fxC5vxcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: UqS4SyUBFWUk-3fPKLUxrPcHSyE4p85Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3MyBTYWx0ZWRfX3RS2AC79Tor5
 fKYiQ6yX5I5spg82+s801uHehn47se/eWBWY5e5VOkCUGnuKFURzzHQ8A65Hi2SDTG5C8sEVqaI
 dNyyk/D2Bpzayd/t5aM5CYMj+PyAePk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230073
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/2026 11:25 PM, Wang Yechao wrote:
> Save and restore the KVM SBI state as a vmstate subsection, so that
> a guest using SBI STA keeps working after live migration. Only the
> STA shmem address (shmem_lo and shmem_hi) is saved for now; other
> SBI state can be appended to kvm_sbi_state as it is added.
> 
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c   |  5 +++++
>   target/riscv/kvm/kvm_riscv.h |  1 +
>   target/riscv/machine.c       | 18 ++++++++++++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index ba5ba63854..0586e290dd 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1015,6 +1015,11 @@ static int kvm_riscv_put_regs_vector(CPUState *cs)
>       return ret;
>   }
>   
> +bool kvm_riscv_has_sbi_sta_state(void)
> +{
> +     return kvm_sbi_sta.supported;
> +}
> +
>   static int kvm_riscv_get_regs_sbi_sta(CPUState *cs)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index aef681f0a2..5e17bacad1 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -35,6 +35,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>   bool kvm_riscv_has_mp_state(void);
> +bool kvm_riscv_has_sbi_sta_state(void);
>   int kvm_riscv_check_timer_frequency(RISCVCPU *cpu);
>   void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>   uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu);
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0de06e9588..9fc699a482 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -318,6 +318,23 @@ static const VMStateDescription vmstate_kvm_mp_state = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +
> +static bool kvm_sbi_state_needed(void *opaque)
> +{
> +    return kvm_enabled() && kvm_riscv_has_sbi_sta_state();
> +}
> +
> +static const VMStateDescription vmstate_kvm_sbi_state = {
> +    .name = "cpu/kvm-sbi-state",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvm_sbi_state_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_sbi_sta.shmem_lo, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_sbi_sta.shmem_hi, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>   #endif
>   
>   static bool debug_needed(void *opaque)
> @@ -645,6 +662,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_kvm_timer_frequency,
>           &vmstate_kvmtimer,
>           &vmstate_kvm_mp_state,
> +        &vmstate_kvm_sbi_state,
>   #endif
>           &vmstate_envcfg,
>           &vmstate_debug,


