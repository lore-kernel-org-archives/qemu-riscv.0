Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D40CD98C7
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 16:22:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXiB1-0001nb-Fs; Thu, 11 Jun 2026 12:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAz-0001nE-AO
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAx-0006ad-RT
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:41 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BEsD5P873704
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aWYEWQoXXsz
 q2CCnDXDZh6Lgo7kjM26o3yuxkKVq0FM=; b=GjoBGq2fIuNIeA6LO8QjwTQzqL0
 WP1qVlPgrfOOP4xIs1UCU+IyeLMmcW/fS7kxJW6P66e/G1uk4rTyBeu+LaaeBWpd
 KhUcTtObd7P7A20EFtX+40q9YGUZieBg9D6081om4RqyLUiHw9y/fz20qg+lmBIv
 JwORy53tGBZDZWAyL28hu/sWY7Oz1ndONT+iCf14Wzl2Zuqacyt0wdNGD1+F1k9b
 bFv/h5zLzHgBfX3WQspdXwH/IhOic/t1y6ZYQrccCHAFtiTPH7jm8o7TugSVWvBn
 PImVsFw5UTfb4dI3+WIbN3tSVSwbyGO/Dt27w/Omq3EMi8AKNYNFOWrWMjQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6smh1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-964172af027so7253521241.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781194958; x=1781799758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWYEWQoXXszq2CCnDXDZh6Lgo7kjM26o3yuxkKVq0FM=;
 b=DJT5HfMsnXgnBeNGO5uidAPaLo5YyF5N3TnD7CsQ6fp3bl3qtbeWDmwWaQyiPn3SXh
 PghdO7OT4ALDWykdDeMybiBp+b0PR0T/UdNpDeT/0UCM3SVBRKJP59KxU9r5yLswzv+J
 oPwyR/V0E/RU+w1JPfZnNe+duXOTPTbPKkTNnKI6txARSQZ3U6vuICsxFhaaaizMhge4
 aRiIHIa78g6GQ4yXRoXOLbv6ywFWGm8OTrRrRs8q7b21wXJq6OD26nrcE2bVMZLCUyGn
 fChEMRygSKIMMAr2Kfz4otuHT/eORmxH2XNNzZkf6LPb0AJhpb5asGEgM6aRgC7Ghlhl
 wXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781194958; x=1781799758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aWYEWQoXXszq2CCnDXDZh6Lgo7kjM26o3yuxkKVq0FM=;
 b=qBjN9mRJds9XolwTzr9LQYF2ERArJOym/yrRQJf8f+b07f+t55zxC0htY3KWUEyYz6
 RG2/H4JSeWuPE5SZ3wDzzF2HlNg6KR6EmCrcd1hnJmTilZdncFhjgUnltvezmivFiCfw
 4Voi2KaTshntjV4RRL7pkZTIT+iI5IbP3KGWQiKgxSQ4jcEE/t5hamCC0BZ6dSJHXozb
 gL7lBekK0f5yRFSRE67qvISL/hx4IEox6Fu7RmxIHS9QpIZmonX82l+/RgHtRRg+qA6c
 j+6BEUXXcq7Gg0gATu4RxYrfLZAtMAvOXYinMHiAVxe/zGmDmjNr6UR9Qyq8vIlDRLVd
 p+0A==
X-Gm-Message-State: AOJu0YwgeQR3YXAguEicmix3THXnI6KtLUSDYpbwbQPYKqyOrPvGh2m3
 tat1/zGr477mBiMzbxVzW7jRF/4pSNiGIAjaM2E2Dv0uQfIWXnSOoToQl1M9jirnBiTGz8KaXVr
 dIxKISbqLU9LF/7Ma47+LANxXy2Yi73rrlfAiiSEzbihO7BDA3rwwaiVFnQ==
X-Gm-Gg: Acq92OFRvun0lck7+ITCysYYwHZecwEJWBiZrIZd9Bs6+cznSE3FjZ6Zxk/Lz2QLD79
 VL6eqs+VgpCH2tEcRkR2571FxNPFpMbytfa0vm7QMWOdTEX1CN6pPfLoa2kSrr7FJP6IereQR8p
 dg0Kiab6BPr/CocATQGlv3HARDa1DqyE6zMZTClr0V2B5+un+QbtKYSuqfDbZFlimSKscl96tg9
 DHDEZY3Mv373TMj9u7SizpPhmruvwQ52W8C5vbd7MmsN6w0K/9+XNWJO27cbi0iNelETugoXCjj
 OU4wHdEytQTFTlvngyiP0SUeXYuyUFC28nPbyb+6UYHhG/BepA//3wrYgDzrsaf+h0EHG+0ShIt
 LXUT2VT2vw1X5sZo2Q8TUM6NcJes07R0lLiqpP8WlM0V5Tn4a6hbDEfgAxCI=
X-Received: by 2002:a05:6122:1c8e:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-5bb0231e205mr2023265e0c.12.1781194957961; 
 Thu, 11 Jun 2026 09:22:37 -0700 (PDT)
X-Received: by 2002:a05:6122:1c8e:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-5bb0231e205mr2023219e0c.12.1781194957559; 
 Thu, 11 Jun 2026 09:22:37 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d1eadaea6asm21879526d6.40.2026.06.11.09.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 09:22:36 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/2] target/riscv/cpu.c: do not default to svbare for bare CPUs
Date: Thu, 11 Jun 2026 13:22:23 -0300
Message-ID: <20260611162223.2361941-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
References: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2ae0ce cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rku2gE6GsbCemJvB6G0A:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: LK7_mxM5WgeZOsRtfzx_FOY0blHj8rLA
X-Proofpoint-GUID: LK7_mxM5WgeZOsRtfzx_FOY0blHj8rLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX2KmXtqpSOKL/
 AxOQdzkhzH+rHA+jEpln9p74LNc4Js/oW0AfG1Vtni3PN5g3N/4ecpvM3pn+fXnNzJ/yG1Fs5yx
 RKd4/yRaErpVwpazsRU/DetpRj7wwm5BiC+Twqb5GvCZlZ1smaq2O/ViA15cIj4UjDf5yc/PGpF
 aPlHyJCUVMQdLjfZyIio27xIdo5FV0oydNQwZ9UvgArVZPz0xr5w+Y9erf4QlFypVoUcjU6w6Nb
 xYZRSZe9eaIvFD/PCdj9BGlhbVV0BdlbKsVjSU/wrzmSJi/pkr21Tvg698ZnaRGTegBbX2ZVY0g
 uFojEURtYGDZaPbgCH6TMbJe9NDJ4A/4u0WIbegf+gXhXF8FdeuN9TNHqzkVvlGwuhFoYfWap4U
 cjwwoVB1JxEnCVtvRGPIqPjOsN/VQLjGgfTidX2nPrwOdhmc3Pv/602cZy3X+WrS05rt1qyP02Q
 p9TuUe64tunTbBvhPKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX39TAWanU43Qn
 y3H13btEcOR8W78dQ33wwdnAl4dNqY9iUsRWeU89rcSSkniETzM6xDY9UF+yTQZAC7IfY4kHWvH
 xFy7nHl3eJFjCSdl6DAbqO7puSNbruA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110164
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Back when we added bare CPUs (rv64i and friends) we didn't had a way of
easily setting satp-mode to 'bare' in the command line, so we decided
that if the user didn't specify a satp-mode we would limit the CPU to
max_satp_mode = bare.

We don't need to do that anymore now that we can set 'svbare' in the
command line, thus users can confortably set 'svbare=on' if they want.

Besides, setting svbare if no satp-mode is provided in the command line
just for bare CPUs, while every other CPU will default to its
max_satp_mode value, is yet another random stuff users have to deal with
for no good reason.  And, on top of all that, this will make it weirder
to use CPUs that uses bare CPUs as their parent type.

Remove this special handling for bare CPUs.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d968daa404..c2f79a1ca0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -510,21 +510,6 @@ static bool get_satp_mode_supported(RISCVCPU *cpu, uint16_t *supported)
     }
     return true;
 }
-
-/* Set the satp mode to the max supported */
-static void set_satp_mode_default_map(RISCVCPU *cpu)
-{
-    /*
-     * Bare CPUs do not default to the max available.
-     * Users must set a valid satp_mode in the command
-     * line.  Otherwise, leave the existing max_satp_mode
-     * in place.
-     */
-    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_BARE_CPU) != NULL) {
-        warn_report("No satp mode set. Defaulting to 'bare'");
-        cpu->cfg.max_satp_mode = VM_1_10_MBARE;
-    }
-}
 #endif
 
 #ifndef CONFIG_USER_ONLY
@@ -896,10 +881,7 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->satp_modes.map == 0) {
-        if (cpu->satp_modes.init == 0) {
-            /* If unset by the user, we fallback to the default satp mode. */
-            set_satp_mode_default_map(cpu);
-        } else {
+        if (cpu->satp_modes.init != 0) {
             /*
              * Find the lowest level that was disabled and then enable the
              * first valid level below which can be found in
-- 
2.43.0


