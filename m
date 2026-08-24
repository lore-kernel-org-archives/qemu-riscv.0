Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A49C61CE3
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySiU-0006pA-97; Mon, 24 Aug 2026 07:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiT-0006nn-NK
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiS-0006D7-7p
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:49 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99EbT2355946
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=bDe6C4ePFwR41eEm
 pDTm55KAgANfLUXKPDOe1fxBTHtMePbdIWSrJ3PTB9OZ1PB5x72jiC5/wZSmvmH3
 /WNkMrBW6zA6/s9O1hqEtfPoM8qFVOvrMQw+5ynR8NQd5alHO6S+2jrhwPg3lmu1
 2SwFNvGVIeel+TICBX63wdfelV9pt5YMUJmQkXA05rfQ+t/S6iJpdiA/1nbD1uJR
 UrmXizRbO3HcU6beT3feDcbyPBICFlogdpvT9jljwlgTDPZ4Ir3zuCzpOUmjJ2b0
 VUhBB66WFrcLp5si+I6wHFuujkRD18FGgmoAR3+FG7eBgTus+HPaHr4AYm0VlzDJ
 BClVjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn96ps-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:19:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-73760a7cd83so3255273137.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570387; x=1788175187; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=FAjcxkeYhGTzVK+SgOKEnFIOCahoNzGpG/2uLOcK6rTAc8ZS+8jqANnoV7mk5XXIVj
 xgTl39+v3rFuK2hMr/tYeHTRK07AHoEACFMuS64mnopcKRINyRR7Dh7phERIfPmngK7r
 e0aPrJXvK/MZeD/Bj4+9Cza+vDfCb+kqbCQn2zE5wymoxFEerZhr4GYdWZJWrWW4YCNr
 vbrfTm0vLER7Vr+E7fbDCxdjVd6VwhXbQGB6ZUWoCoqnlhPAFa7okXZBtKHAq6zQvsHf
 heWSRJaVVjvOeNmS65WHiiSHPZyr+AVM47MucZakyUN8BX3AVlFKha/tvgFlJgNcCVCD
 hJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570387; x=1788175187;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=VkTyCUcpICMQTWclC5LrE3uz7TDDdaRX9vX16iZy5q2ekkDlPaPOv8S//4sC7Auc5N
 sXE2DeO+9tL1TAL8UOMtcwpdaNYq01ouPGnd7AaUJp0ngjhJlD3hKsx+5JsisFlQSeQh
 tr3xTi42AgRt0qnVYYuGVWjOQawSyywzy6hBHzNYesPOTBVIiYGiAIxJFstiN0MO/dza
 J3A5p9ZQf+xdF+k6DquW8szflsFrwmnZHzKzsFxF8G6I87WLXFSIKIcFXRGkFJ/yHEvl
 tHFWnbtIgLPBicyAZUwLHsroTXaXbqjnWF7MqmFkkIAuHan1iTB0Gg/dH6D5JLBrr6Y8
 8SRg==
X-Gm-Message-State: AFuF++n1JktR/b8ojAiVarCHMTMYhVpZHGlTcHxxt+/TuU0ROr3SdIQC
 AlsSL+ezunuF7x4vM4PAgPoxMiXcx7968iVYx0nSr9smdHkwDGocU4YPIggwDmx0wKyIC25KNh6
 Xy5rXM80mgHvM9l1siUtoyLF2dzPwTHslDxmJZmFYoOvnA8VJ435FGVXX7Q==
X-Gm-Gg: AR+sD13Knu6B8AEqmKr4fEWnMcw+4CJo+lgp2m31UVauXzGUwaF/BgMQCM2TPfgAJbR
 6TvpUo/6chFoSDGTWFEE1Kyr3cBo3tBTTaWjLfonwJf+b0oMmLhN1lvs3HKHa/clJcOxGwV6Kly
 BF2VPdbqtDLD3ZcQ83xlmFpfGF5oEOjdgF6RDQVIp0tz2k/uYsrP21yjunSvbyjtqYUudhRPDsn
 kpkOEJZKSW/BCYTZU/DOUk5zKUmRy8e57hwyrrCYEcmdGi2iS1uD7dzAf+hHKHwm+qtFJz3MQoZ
 2z2M4isEXw5vuQxFZqP5NSHMr0n6i+gQudQxm18DM8qmJBrnmT6ge1vkHMgWQyQ2Qm0UYAbZnQU
 A4GUANs4NK0L5EDRk+azxVHlAj9oEPauelm2OmcxeVHCD5bwhsg==
X-Received: by 2002:a05:6102:570f:b0:77e:eeab:769 with SMTP id
 ada2fe7eead31-77eeeab1417mr1194124137.10.1787570386782; 
 Mon, 24 Aug 2026 04:19:46 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:77e:eeab:769 with SMTP id
 ada2fe7eead31-77eeeab1417mr1194090137.10.1787570386397; 
 Mon, 24 Aug 2026 04:19:46 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e00129fsm9817576a12.1.2026.08.24.04.19.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:19:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v4 14/20] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Mon, 24 Aug 2026 13:17:03 +0200
Message-ID: <20260824111711.26297-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX68Cf7ZaMP8z/
 hCQHThzGuqBQATIJJ77HHHgBzb2oZp+DfkkTWTNpRdQwTqElN3cN0ths/j+oLNzAzECj0EXAxWh
 DM+5LYWIttt6s1drPTUkHBjm5Skj+Tk=
X-Proofpoint-GUID: qNBsqC-Kc2-LgCWrl3TERN3XrTr8E3Ov
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c28d3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXy0WigspabAg5
 G41SClO4eOyI2QateCDdoYa/m1ics+X31LbAiaAUEfASGBML/nV3KIcG2IMEhDyDw1HvbdlK6aN
 u4P5ag/h6stUDmq+cXWM9lP8tfcU9uQzHesu6zicEB1zKmQDV+xPrML4eSBnKdp9W/OknqplVml
 IzCsHlvkiseNpvn4GNpnlg+PykmE+79VCt7d/Tfuy9ebKnF+ytHVmbJA6FaAt6+72RDg+MNbwe3
 Xj5DTbUyf4pQH+JScGh2IvyPhE6Sjo9VC/tK1VORdChNnnRCxSAyE+Z8/vQgrJ3iP5fGeQn9/LC
 ci4cx9iFl9l9aFOcztrTd07i7uMeOA4uaAHXL9S5owkOlcYlXpNuej3bg433faRoyBqz1K0yk4u
 gcNtA1tW+h1bxuswR2Q+fBayWawvYopWGzuabWkC/QxRn5ViP47b+3tUwpS6vdCMTl5vBGeWNA5
 qtkbOgXlhM6z9WvYB/A==
X-Proofpoint-ORIG-GUID: qNBsqC-Kc2-LgCWrl3TERN3XrTr8E3Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 376cff656fa..bb4c8563554 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -642,7 +642,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bf098319f8..858fbf865fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,7 +866,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0


