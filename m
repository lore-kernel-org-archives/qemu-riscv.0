Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2409BC5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:54:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyTFd-0005V3-5V; Mon, 24 Aug 2026 07:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyTFZ-0005TC-SN
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:54:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyTFX-0000vl-Uk
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:54:01 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OBMhbt2846109
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GI5Jgp0Qctif8rzqQ9Ku0eL6Ypzf1pF6t/kI5aL2bPc=; b=K0lnBWcmrUekLo+A
 sgQKNMvSQHZNLHDPZyj7pk+PVtNTaXjMQO00HCCsa8dTgq8a4qNTAZBaFcGl5YpN
 0vPCTyMJmnoUfnhxeC0TSjcaNwIhxl/BlkRoJStzcx4C83EFTnMznTcYGRtcGn0i
 Gjta6+MECHycuI2r5WBZuZnpn8NqllekvvqPS2ohn7Op4FK5Iz03E0subndqu4jb
 4WM9yKCHpGPkBgYTIiT4yk4NAm3p2RB1dIy/t17TZhCbHRLmBC3LdgDPVvzbSl+6
 65vP+GpksVR5qlGDxRHb1fhtKJISKkODS6GmqDovNZmLZ7U6LELselp3eN6RMi6L
 OtuQYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jgxp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:53:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0408254aso59702431cf.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787572437; x=1788177237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GI5Jgp0Qctif8rzqQ9Ku0eL6Ypzf1pF6t/kI5aL2bPc=;
 b=JKEcpe3x3PholsTpZuJqzE16j9mHcwdodgttkJ9mJxJKA/p1ZecXemaiZ01opCi2MY
 BMNb1VRTOfeDJ+1ChpSPimQrFrhP7dvEN/S70Ao6mUSsce19kfj5shXv9xgKgO+SPbCV
 r1tCgBhm1tJR67i6PGFS7OdZBD9ZowHoazVH6OelqlN1fXimPri79dwwR1Sc+lIj1aBC
 fTC3MbHjUpdA+3kO/F9ozE6Vho/ruNZU+IZxr/bGzVD5ekHwRnrX6+YxiLrKN/IeM5X8
 WHN4ZFS/Ju948IBAYWHWXvN1TJdZbfnyXAzKMmGpY/OE8iaTtXRc7BPWqiaCeX2gutnw
 0Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787572437; x=1788177237;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GI5Jgp0Qctif8rzqQ9Ku0eL6Ypzf1pF6t/kI5aL2bPc=;
 b=eSAIX7qUWskCK+DJXIl6Qo+p3iss5h0ijrNGAAhmZ17NiZmjJE66bnIl/cpBsVdNQe
 zDXUc2ekPOg+KEbgn7B4QTOsuxLBoYIS1Kdynnf8ovGqSr12ZeifOpIVOXCGUuEVeISp
 PzBJDgZ1tg4YWoWB7beuNXMbY3+KnyKQLS3UE0y2D/h4wvmuHnnrqpTdGySkWfhhNilh
 dhkTWCa6yvlvyrQCik4tXZ4F9zrg+B/a6L9n8w0nXn7HI4iX0eP4zVj+oFFbRYPxAimY
 56INyGiSrITi2y/oiSm0Iph//K0sBAY5NynRLpFDge31HZeLnJPaxy7OEVThCzPNKHXO
 UTlg==
X-Gm-Message-State: AFuF++msfg6RKu5TGeIE+KEmHKrWsznqtQ9K/lsAJC7WUR5Zu0dKONyo
 XDRsgrbK1JFdXbQN2bj8vNZz6CblddMiFysg8gYgaeeR47wAOoY4uSqBG4jw2Xllno9kgtkZqjn
 /8fG2NuYtBZN5oMyeZpbncMAhWALKuWALBWbf4pVnmsE02942pZTipeFEkw==
X-Gm-Gg: AR+sD11nOo0b7GoZegJCRVBwCszhECeGET9fdT34qQvbGoHAOi0IE48vrOCg7E7eAep
 nVI5eWzWWDcKSVA9WU3q2kUVvXyJfOi/asRUL1/cSZCWoOcs274Gzje86mdD8GCJhfVuQ2cVPUU
 YcR+pdFxu/vzOhEm089AlfTAsFn6AhbW5IHTJoH7mHghkGo7piyZH3TdB43HUEJ1ss6fwcaOwwD
 ZllJEwqycVewFWjovUpU10QVL1TOGSLTjl4Df9sCwPbRn78YYORqUSuRoOQvIaPSbMm43fQOV3S
 eJdVdHVJ2SPhZiZLJpMwjwzUi/jjlXYiHlGJHqoi+f9LHnruKT+0y6B2+odNQqH+NAZJhoYHsXS
 Gx2JaX77fZGfVKcx5JAlYxGW8Ihq+4mWI92rZ
X-Received: by 2002:ac8:6f0c:0:b0:51c:4f35:81b8 with SMTP id
 d75a77b69052e-52df63fa288mr242216721cf.7.1787572436933; 
 Mon, 24 Aug 2026 04:53:56 -0700 (PDT)
X-Received: by 2002:ac8:6f0c:0:b0:51c:4f35:81b8 with SMTP id
 d75a77b69052e-52df63fa288mr242216401cf.7.1787572436551; 
 Mon, 24 Aug 2026 04:53:56 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e09aca49dsm45259871cf.23.2026.08.24.04.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 04:53:56 -0700 (PDT)
Message-ID: <053c35d3-5a72-4c1d-947a-a9dda6a2c999@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:53:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: reject FMV.X.W and FMV.W.X with Zfinx
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20260813041304.7618-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813041304.7618-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c30d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=cDuQM5WIG8g1AS9iI0wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9FQBEh2EVRMW
 EHAtfEC3EDR6bAY8dVtKEZpbLFDf1f7AVHqmpgcrgZCtq5rmlBg+zxKvpd5ADbFjCYmVR9dhZLM
 aDWPzzMBtMZVnWj5eqxdwltFFe5J9jQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7jdjgP3BbdWK
 OlvfJfDU2550YfUbSSNdiUSfAQciVoudzf0fx0C7yr1J+hpxnBdR8kfeCYbu1f6BGIstPWXFv2Z
 v+kDr9xZug1qPUGXxsA0StYsMk2DNYVCcvy1Co4dv4Iw3cf7vQ5kSjNQqpoJ7FIYSrRsa5tVV7f
 CA8ssxibOhsJ2ilzhpvGgvdfYBH/hWcfDxDPNiFfu3qzYDrFUT6i9kZGoB/dyOUUtVCDJ9uCSko
 vye+C8mxm78W1BL3xTBNth1YryDiZ5Hvcifm9bwlmbYnRsP464feZr9ROW24hlscPlVGoqBz4yr
 W/bpYcvFVs2arNZ8mv8gl7rxr4gI3Gqof2k7dBAtr+VQZayj6DDyGCKjiKYf9X22gcQi1elyroA
 AR97/FWXjaL3Aiy33R2c5NBGwXFWOdLSzL3xi2sa1NIaQ1c+h4AVxMaKK2iPQkzppu/7vHcnORA
 oldban2cNPZl1tag+Cg==
X-Proofpoint-ORIG-GUID: h0P0tIlG2p6LWnJdvJX31Vwr9N7-Vikq
X-Proofpoint-GUID: h0P0tIlG2p6LWnJdvJX31Vwr9N7-Vikq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

Seems like this has been fixed by this patch that is currently on the
queue for merge:

[PULL v2 87/96] target/riscv: reject FMV.X.W/FMV.W.X under Zfinx

I'll send an email letting people know that we should comment in Gitlab
when a bug fix is sent.



Thanks,
Daniel

On 8/13/2026 1:13 AM, Zephyr Li wrote:
> Zfinx excludes FMV.X.W and FMV.W.X, but QEMU currently accepts both
> instructions when Zfinx is enabled without the F extension.
> 
> Require the F extension for these instructions so they raise an illegal
> instruction exception on Zfinx-only CPUs.
> 
> Add TCG regression tests for both instructions.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4108
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---
>   target/riscv/tcg/insn_trans/trans_rvf.c.inc |  4 +--
>   tests/tcg/riscv64/Makefile.target           | 10 +++++++
>   tests/tcg/riscv64/test-zfinx-fmv-w-x.S      | 33 +++++++++++++++++++++
>   tests/tcg/riscv64/test-zfinx-fmv-x-w.S      | 33 +++++++++++++++++++++
>   4 files changed, 78 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/riscv64/test-zfinx-fmv-w-x.S
>   create mode 100644 tests/tcg/riscv64/test-zfinx-fmv-x-w.S
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvf.c.inc b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> index e935523c93..70c66e9e25 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> @@ -428,7 +428,7 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>   {
>       /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
>       REQUIRE_FPU;
> -    REQUIRE_ZFINX_OR_F(ctx);
> +    REQUIRE_EXT(ctx, RVF);
>   
>       TCGv dest = dest_gpr(ctx, a->rd);
>       TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> @@ -531,7 +531,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
>   {
>       /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
>       REQUIRE_FPU;
> -    REQUIRE_ZFINX_OR_F(ctx);
> +    REQUIRE_EXT(ctx, RVF);
>   
>       TCGv_i64 dest = dest_fpr(ctx, a->rd);
>       TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
> index 4da5b9a3b3..23e1152a10 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -18,3 +18,13 @@ TESTS += test-fcvtmod
>   test-fcvtmod: CFLAGS += -march=rv64imafdc
>   test-fcvtmod: LDFLAGS += -static
>   run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,zfa=true
> +
> +TESTS += test-zfinx-fmv-x-w
> +test-zfinx-fmv-x-w: LDFLAGS = -nostdlib -static
> +run-test-zfinx-fmv-x-w: QEMU_OPTS += \
> +	-cpu rv64,f=false,d=false,zfa=false,zfh=false,zfhmin=false,zfinx=true
> +
> +TESTS += test-zfinx-fmv-w-x
> +test-zfinx-fmv-w-x: LDFLAGS = -nostdlib -static
> +run-test-zfinx-fmv-w-x: QEMU_OPTS += \
> +	-cpu rv64,f=false,d=false,zfa=false,zfh=false,zfhmin=false,zfinx=true
> diff --git a/tests/tcg/riscv64/test-zfinx-fmv-w-x.S b/tests/tcg/riscv64/test-zfinx-fmv-w-x.S
> new file mode 100644
> index 0000000000..73c5c2b2bf
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zfinx-fmv-w-x.S
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <asm/unistd.h>
> +
> +        .text
> +        .globl  _start
> +_start:
> +        .option norvc
> +
> +        li      a0, 4
> +        la      a1, sa
> +        li      a2, 0
> +        li      a3, 8
> +        li      a7, __NR_rt_sigaction
> +        scall
> +
> +        .word   0xf0030453
> +
> +        li      a0, 1
> +        j       exit
> +
> +pass:
> +        li      a0, 0
> +
> +exit:
> +        li      a7, __NR_exit
> +        scall
> +
> +        .data
> +        .type   sa, @object
> +        .size   sa, 32
> +sa:
> +        .dword  pass
> +        .zero   24
> diff --git a/tests/tcg/riscv64/test-zfinx-fmv-x-w.S b/tests/tcg/riscv64/test-zfinx-fmv-x-w.S
> new file mode 100644
> index 0000000000..c4e853036f
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zfinx-fmv-x-w.S
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <asm/unistd.h>
> +
> +        .text
> +        .globl  _start
> +_start:
> +        .option norvc
> +
> +        li      a0, 4
> +        la      a1, sa
> +        li      a2, 0
> +        li      a3, 8
> +        li      a7, __NR_rt_sigaction
> +        scall
> +
> +        .word   0xe0030453
> +
> +        li      a0, 1
> +        j       exit
> +
> +pass:
> +        li      a0, 0
> +
> +exit:
> +        li      a7, __NR_exit
> +        scall
> +
> +        .data
> +        .type   sa, @object
> +        .size   sa, 32
> +sa:
> +        .dword  pass
> +        .zero   24


