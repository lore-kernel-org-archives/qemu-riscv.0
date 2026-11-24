Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA75606A691
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPsf3aTo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYiPKar4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVt95-0008Ae-FK; Tue, 24 Nov 2026 11:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVt90-00089K-MC
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 11:13:23 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVt8y-0001DT-5x
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 11:13:22 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOFLGLU4124327
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 16:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /AYPQQmmExJ/bArdg/hnXvAX3qAATfSXQTZhVZHAXjs=; b=kPsf3aTofUD6BKtw
 EZpdW+e+Z4i6MaPptgHQ22KbFxWAvc10+H1XE26T0G19n560ZG5LdLQ9FS/OkU0B
 A1roecn8Z7BgvWZ1Kz8DJJUwc2hSI+rweL30T1qDtFvyNxSWWxTIfcwCfF4TiY4F
 1LhpmSYsdKlvodjX3zkvVLU5HbZumZfaXZ/B8i6p4xL08k2GQ4bZ8zAjzuqMAm1p
 yATWKv8dy1Hmi3DHi+VVFAR/y3U9msYnBN539WKg5NioX3qzSCgB6BqeSwnQbWca
 u7m9Qv0DYxV218//UBmQytTHXT8vaoB2NMhh7L1i1dZvr6VU9N+Ojf6AA+ooXnZw
 Xw3fAQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhanrg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 16:13:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so80702396d6.2
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795536795; x=1796141595; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/AYPQQmmExJ/bArdg/hnXvAX3qAATfSXQTZhVZHAXjs=;
 b=LYiPKar4r2HGC0G/Nx4rxy13uvjraG65kkYiViMXgp0k2gheT+Or3ow3SxrlI7kqoY
 uNhDhx/vYFmIY1Xa1We57a4u1K96oR08WPllpp9LN+csRttulu+F6FdvLzcUAEk1iDxS
 RYdrGCM8Yrbhh0XLDs602uCQ84pGFRMZ/EG3wVIZjBkyrpxOD/VfMlxBvdxglYX8DeMl
 SAv+fmsG3AnHMAqIgGc2N7/WUK8dqmxzQtosUX8fCEcZJt9czK/ZsMRjRdT6vgPBT5lS
 KLDVcC5O+XjnWw19y5E6hsvp8yii3uJLSP1HMyYpRglASlKV3ZP+XYlRTvnAoxvvFDVJ
 GQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795536795; x=1796141595;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/AYPQQmmExJ/bArdg/hnXvAX3qAATfSXQTZhVZHAXjs=;
 b=NaSRdOxsE/IwvluvQtC9471Oi5tN2x4KedOyLTiaF/vF+siPisiyMzJC1gAQljiJTu
 19zC158pQTSL3faWeqXC4XcDGJchNtFydP4gZoo/Xjf28Q51iW8V2U72frDNkuZWZ/NP
 PmkXr/ZEvzy2chxi2uAcpBFH10ul0FHDQNWC7N5uIrIAZmFBz8pTdgUXLzMPIFvcdA7j
 wb/pE3OCKKQEAerRH45xienj15F9+vkbzVim64JdfXRy64fwxoO3tc7mNDKu6/tg5aHq
 /UpmaRmW0HWrj90ZcCM9hTWE/yjJMax0IvT/vtqmwzkbKLuYBzOUzk2mjNPHHGyl070I
 5lOg==
X-Forwarded-Encrypted: i=1;
 AL+hErGizc+mWDWq7cuKDZIfL3FgHpZS0+pG/se74v44IL4L2BwvIL5Jhgk0qKrfEphTvjw3oT2lA4O8ifaV@nongnu.org
X-Gm-Message-State: APuU4Z8WPhJuHcpvRz3JizMOXN/kzTV0L0nlORdLebTMhyEAsEzPFuVl
 FrXnQdRPQkrkopAujHD4ZyduBAZAu3O6Nsd1wD6/6729UITc4Pfuc9OwWStG/ziJerRMRPh7x2s
 bKf651MbdvRLMApTZGCYMh1Vy2Widlt9rRyROjFnBPIpKmey0wRWquZZI5w==
X-Gm-Gg: AZFdTZeZz0Y3lwGvZ6x/gBgQjp9RZYh0k8wIJshwRMcOruio4/DppCBuvqXFzDd9OVL
 LZV58iL/nko3iOL01pA7evjqAmovT7kI2tPTcU0KOOHdARGeWyS6XsmYa36IxTCzBCneUzV3FXl
 /crlWLmYgY3QFnpQwhZv1Y3HJlt+iH+UnWGDPx5HNQAMnlBfBbMxuikbmoUIhIKH9jmRFXBZFOw
 3pFpTNXTMoqx8kaPMPqUaQTjfZY+/XHR0CyjHDf7f3IB8gKDa/XCbo13g6qg1EI02gWuFuPRTaJ
 vg3lEFuNp6MAU4a1i5XB4AMBEVqj0R/xODdMf0G25aDPWMVgoblFemOrNQXoybqnyrFIIfvluvD
 YjyEgRjB3l6X0Fxb0ShdGKTVj342nZ7PbrXaqEMib79fwpyZ2ZuXPaFwFGHHff+dG2FnqkI9qkV
 Io2nBOi7ES
X-Received: by 2002:ac8:5d09:0:b0:535:a20:8277 with SMTP id
 d75a77b69052e-55d769940e9mr281913621cf.10.1795536795125; 
 Tue, 24 Nov 2026 08:13:15 -0800 (PST)
X-Received: by 2002:ac8:5d09:0:b0:535:a20:8277 with SMTP id
 d75a77b69052e-55d769940e9mr281912841cf.10.1795536794488; 
 Tue, 24 Nov 2026 08:13:14 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d78811fd5sm132540511cf.8.2026.11.24.08.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 08:13:13 -0800 (PST)
Message-ID: <67da6667-477e-4c94-a678-7c5345c8600b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:13:09 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: make Zicfiss CBO checks independent of TLB
 state
To: Abhigyan Kumar <314abh@gmail.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20261114215908.260568-1-314abh@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114215908.260568-1-314abh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05b79c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=Dezw0IVeCP2Y-Kh92igA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXyYGALSbgGEEZ
 JA9sp85ZOpqSvjgDq+OVj17XK7vdUlMfMJlh0pKC+Wm3IZW9/AfStX1B4LDLx7ocdNJI45+gzvZ
 PF+m1pQ3RGMabrwG5n36tZ0fWH2LvVU=
X-Proofpoint-GUID: Tga4Kj901m8i_aygMy5GzD6XE2l019o1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXxhi7FK+gIPYi
 +TWEfowePbHD/qcshnGMMTlaH9ZHQFU6gotkFAdnlxRbrw7DgM4fm/SumBT2jMHFbxfucuVwq7A
 oLHOkTQJofw4a0zF9YRarlQgMCB6XExjxS1ApPNs1JQIFKDw4xaLx/JSKpD8bVXj9laevtYFkQB
 5QERVRn/zk3+BQ/MJXuopTn4gmy6kwqs2uXSiGvVJT0XOyWE3n38AOSH62GOPdiP2TW25IFxzQM
 zAMpABfK3UMxBVXCLzCUThXliBU5ktfGpRoR+jBdMYzTM6TPvr8yokL9VExETD7kBs01qsS7+G3
 1/VND88NcnlEtTe6eOy+fUsiHveNof3BvJYT0aB9oTEbgIw3hOLSLazK7cTGdm+dGhuAPCHEJ+Z
 14P8BFhoVfXpBGqyLPY3pYe+wFk902kXiIus8h56CvkYORZr7rSCRryMRpYZkHKIkbJY1O6OOde
 KbphbMvIcuE4AjqxVQg==
X-Proofpoint-ORIG-GUID: Tga4Kj901m8i_aygMy5GzD6XE2l019o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


This patch fails to build, at least in my env, when applied on top of
alistair/riscv-to-apply.next (https://github.com/alistair23/qemu):

[1889/2854] Compiling C object libqemu-riscv64-softmmu.a.p/target_riscv_tcg_op_helper.c.o
FAILED: libqemu-riscv64-softmmu.a.p/target_riscv_tcg_op_helper.c.o
cc -Ilibqemu-riscv64-softmmu.a.p -I. -I.. -Itarget/riscv -I../target/riscv -Isubprojects/libvduse -I../subprojects/libvduse -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/slirp -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing 
-fno-common -fwrapv -ftrivial-auto-var-init=zero -fzero-call-used-regs=used-gpr -fstack-protector-strong -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-overflow=2 -Wformat-security -Wformat-y2k -Wignored-qualifiers -Wimplicit-fallthrough=2 -Winit-self -Wmissing-format-attribute -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -Wshadow=local -Wstrict-prototypes -Wtype-limits -Wundef -Wvla -Wwrite-strings -Wno-missing-include-dirs 
-Wno-psabi -Wno-shift-negative-value -isystem /home/dbarboza/work/qemu/linux-headers -isystem linux-headers -iquote . -iquote /home/dbarboza/work/qemu -iquote /home/dbarboza/work/qemu/include -iquote /home/dbarboza/work/qemu/host/include/aarch64 -iquote /home/dbarboza/work/qemu/host/include/generic -iquote /home/dbarboza/work/qemu/tcg/aarch64 -fPIE -pthread -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR=1 -isystem../linux-headers -isystemlinux-headers -DCOMPILING_PER_TARGET 
'-DCONFIG_TARGET="riscv64-softmmu-config-target.h"' -DTARGET_ARCH_PREFIX=target_riscv '-DCONFIG_DEVICES="riscv64-softmmu-config-devices.h"' -MD -MQ libqemu-riscv64-softmmu.a.p/target_riscv_tcg_op_helper.c.o -MF libqemu-riscv64-softmmu.a.p/target_riscv_tcg_op_helper.c.o.d -o libqemu-riscv64-softmmu.a.p/target_riscv_tcg_op_helper.c.o -c ../target/riscv/tcg/op_helper.c
../target/riscv/tcg/op_helper.c: In function ‘check_zicbom_access’:
../target/riscv/tcg/op_helper.c:237:14: error: unused variable ‘fault_addr’ [-Werror=unused-variable]
   237 |     uint64_t fault_addr = address;
       |              ^~~~~~~~~~
cc1: all warnings being treated as errors


This happens because 'fault_addr' is being used only inside the #ifdef:


#ifdef CONFIG_USER_ONLY
     ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
                              mmu_idx, true, &phost, ra);
     if (ret & TLB_MMIO) {
         env->badaddr = fault_addr;
         riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
     } else if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
     }
#else
(...)
#endif


And, for riscv64-softmmu builds, the variable will be left unused and gcc will nag about it.


Can you please rebase the patch on top of alistair/riscv-to-apply.next branch
and re-send?  Thanks,

Daniel


On 11/14/2026 6:59 PM, Abhigyan Kumar wrote:
> The Zicfiss extension requires CBO.CLEAN/FLUSH/INVAL on a shadow stack
> page to raise a store/AMO access fault. Citing section 15.1.2.3 ("Shadow
> Stack Memory Protection") of the RISC-V spec:
> 
>      "Memory mapped as an SS page cannot be written to by instructions
>      other than SSAMOSWAP.W/D, SSPUSH, and C.SSPUSH. Attempts will raise
>      a store/AMO access-fault exception. Access to a SS page using
>      cache-block operation (CBO.*) instructions is not permitted. Such
>      accesses will raise a store/AMO access-fault exception. Implicit
>      accesses, including instruction fetches to an SS page, are not
>      permitted. Such accesses will raise an access-fault exception
>      appropriate to the access type. However, the shadow stack is
>      readable by all instructions that only load from memory."
> 
> Currently, CBO.* instructions quietly return when operated on a shadow
> stack page. check_zicomb_access probes pages for read with non-fault
> set. Then, get_physical_address reports a shadow stack page as
> unreadable when called from a probing tlb_fill. But it only works when
> probe reaches tlb_fill. After a usual load, probe hits TLB and reports
> the page as readable. Hence, causing CBOs to quietly return.
> 
> This commit introduces CPUTLBEntryFull.extra.riscv.sstack as
> a marker for shadow stack pages inside TLB entries. When riscv.sstack is
> set, check_zicbom_access falls through it to probe_write.
> 
> With this commit, the now-redundant special case in get_physical_address
> for probe is removed. is_probe in a call to get_physical_address is
> replaced with is_sstack_page. As a side effect non-fault probes of
> shadow stack pages no longer see them as unreadable, matching what a
> usual load does.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4789
> Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
> ---
>   include/hw/core/cpu.h         |  5 ++++
>   target/riscv/tcg/cpu_helper.c | 49 +++++++++++++++++++++++++----------
>   target/riscv/tcg/op_helper.c  | 16 ++++++++++++
>   3 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 5b7c330047..71666a5497 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -277,6 +277,11 @@ struct CPUTLBEntryFull {
>               uint8_t shareability;
>               bool guarded;
>           } arm;
> +
> +        struct {
> +            /* Zicfiss shadow stack page. */
> +            bool sstack;
> +        } riscv;
>       } extra;
>   };
>   
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c..d1b902fea2 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1096,7 +1096,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                                   hwaddr *fault_pte_addr,
>                                   int access_type, int mmu_idx,
>                                   bool first_stage, bool two_stage,
> -                                bool is_debug, bool is_probe)
> +                                bool is_debug, bool *is_sstack_page)
>   {
>       /*
>        * NOTE: the env->pc value visible here will not be
> @@ -1254,7 +1254,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>               int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
>                                                    base, NULL, MMU_DATA_LOAD,
>                                                    MMUIdx_U, false, true,
> -                                                 is_debug, false);
> +                                                 is_debug, NULL);
>   
>               if (vbase_ret != TRANSLATE_SUCCESS) {
>                   if (fault_pte_addr) {
> @@ -1411,6 +1411,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           return TRANSLATE_FAIL;
>       }
>   
> +    /* If gets stale after a goto restart. */
> +    sstack_page = false;
> +
>       target_ulong rwx = pte & (PTE_R | PTE_W | PTE_X);
>       /* Check for reserved combinations of RWX flags. */
>       switch (rwx) {
> @@ -1421,10 +1424,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           if (cpu_get_bcfien(env) && first_stage) {
>               sstack_page = true;
>               /*
> -             * if ss index, read and write allowed. else if not a probe
> -             * then only read allowed
> +             * If ss index, read and write allowed, else allow only reads.
> +             * Page flagged in TLB for CBOs to be able to tell them apart.
>                */
> -            rwx = is_sstack_idx ? (PTE_R | PTE_W) : (is_probe ? 0 :  PTE_R);
> +            rwx = is_sstack_idx ? (PTE_R | PTE_W) : PTE_R;
>               break;
>           }
>           return TRANSLATE_FAIL;
> @@ -1539,7 +1542,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>               int gpa_ret = get_physical_address(env, &gpa_paddr, &gpa_prot,
>                                                  pte_gpa, NULL, MMU_DATA_STORE,
>                                                  MMUIdx_U, false, true,
> -                                               is_debug, false);
> +                                               is_debug, NULL);
>               if (gpa_ret != TRANSLATE_SUCCESS) {
>                   if (fault_pte_addr) {
>                       *fault_pte_addr = pte_gpa >> 2;
> @@ -1612,6 +1615,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       }
>       *ret_prot = prot;
>   
> +    if (is_sstack_page) {
> +        *is_sstack_page = sstack_page;
> +    }
> +
>       return TRANSLATE_SUCCESS;
>   }
>   
> @@ -1669,13 +1676,13 @@ bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
>       int mmu_idx = riscv_env_mmu_index(&cpu->env, false);
>   
>       if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
> -                             true, env->virt_enabled, true, false)) {
> +                             true, env->virt_enabled, true, NULL)) {
>           return false;
>       }
>   
>       if (env->virt_enabled) {
>           if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
> -                                 0, MMUIdx_U, false, true, true, false)) {
> +                                 0, MMUIdx_U, false, true, true, NULL)) {
>               return false;
>           }
>       }
> @@ -1779,6 +1786,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       bool first_stage_error = true;
>       bool two_stage_lookup = mmuidx_2stage(mmu_idx);
>       bool two_stage_indirect_error = false;
> +    bool sstack_page = false;
>       int ret = TRANSLATE_FAIL;
>       privilege_mode_t mode = mmuidx_priv(mmu_idx);
>       /* default TLB page size */
> @@ -1794,7 +1802,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           /* Two stage lookup */
>           ret = get_physical_address(env, &pa, &prot, address,
>                                      &env->guest_phys_fault_addr, access_type,
> -                                   mmu_idx, true, true, false, probe);
> +                                   mmu_idx, true, true, false, &sstack_page);
>           /*
>            * A G-stage exception may be triggered during two state lookup.
>            * And the env->guest_phys_fault_addr has already been set in
> @@ -1816,7 +1824,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   
>               ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
>                                          access_type, MMUIdx_U, false, true,
> -                                       false, probe);
> +                                       false, NULL);
>   
>               qemu_log_mask(CPU_LOG_MMU,
>                             "%s 2nd-stage address=%" VADDR_PRIx
> @@ -1854,7 +1862,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           /* Single stage lookup */
>           ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                      access_type, mmu_idx, true, false, false,
> -                                   probe);
> +                                   &sstack_page);
>   
>           qemu_log_mask(CPU_LOG_MMU,
>                         "%s address=%" VADDR_PRIx " ret %d physical "
> @@ -1880,8 +1888,23 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       }
>   
>       if (ret == TRANSLATE_SUCCESS) {
> -        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> -                     prot, mmu_idx, tlb_size);
> +        /*
> +         * tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> +         *           prot, mmu_idx, tlb_size);
> +         */
> +        CPUTLBEntryFull full = {
> +            .phys_addr = pa & ~(tlb_size - 1),
> +            .attrs = MEMTXATTRS_UNSPECIFIED,
> +            .prot = prot,
> +            .lg_page_size = ctz64(tlb_size),
> +            /*
> +             * Allows CBO.* to differentiate between a shadow-ss from a usual,
> +             * readable one.
> +             */
> +            .extra.riscv.sstack = sstack_page,
> +        };
> +
> +        tlb_set_page_full(cs, mmu_idx, address & ~(tlb_size - 1), &full);
>           return true;
>       } else if (probe) {
>           return false;
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index f9c79fe6b9..a289cb1a84 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -224,6 +224,9 @@ void HELPER(cbo_zero)(CPURISCVState *env, target_ulong address)
>    * section 2.5.2 of the CMO specification) for Zicbom, raising
>    * either store page-fault (non-virtualized) or store guest-page
>    * fault (virtualized).
> + *
> + * Zicfiss: CBOs on a shadow stack page always raise a store/AMO access fault
> + * even though loads are allowed.
>    */
>   static void check_zicbom_access(CPURISCVState *env,
>                                   target_ulong address,
> @@ -233,6 +236,9 @@ static void check_zicbom_access(CPURISCVState *env,
>       int mmu_idx = riscv_env_mmu_index(env, false);
>       uint16_t cbomlen = cpu->cfg.cbom_blocksize;
>       void *phost;
> +#ifndef CONFIG_USER_ONLY
> +    CPUTLBEntryFull *full;
> +#endif
>       int ret;
>   
>       /* Mask off low-bits to align-down to the cache-block. */
> @@ -250,12 +256,22 @@ static void check_zicbom_access(CPURISCVState *env,
>        * addresses, whether a cache-block management instruction is
>        * permitted to access the cache block is UNSPECIFIED."
>        */
> +#ifdef CONFIG_USER_ONLY
>       ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
>                                mmu_idx, true, &phost, ra);
>       if (ret != TLB_INVALID_MASK) {
>           /* Success: readable */
>           return;
>       }
> +#else
> +    ret = probe_access_full(env, address, cbomlen, MMU_DATA_LOAD,
> +            mmu_idx, true, &phost, &full, ra);
> +    /* A shadow stack page is readable but faults after fall through. */
> +    if (ret != TLB_INVALID_MASK && !full->extra.riscv.sstack) {
> +        /* Success: readable */
> +        return;
> +    }
> +#endif
>   
>       /*
>        * Since not readable, must be writable. On failure, store


