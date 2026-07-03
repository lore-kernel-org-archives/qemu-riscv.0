Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE07AC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:07:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIR-0002l3-Ez; Fri, 03 Jul 2026 14:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiI0-0001o7-Le
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHy-0002O3-B8
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:00 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiVWB545608
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=; b=cTm08a5pzlP1ENT+
 hfjfB36eZYYJNdEU2pwCxBjI9oLk+FpyXWIiejTxE7tFJTMtMmWWA+oKz1qsAxla
 HBF57EDtGR7LmXuGObmZVJYm9lzz8GtZO/MEVJ7CLYN3Xy7L9cN7yJu9YxtLnaHH
 81nsHOC0gO5Xwc1uHVY4ygQAXv7uEjyMIb1ibiklzPJm4e6WAoNxsgHZEcrusOyf
 8dDVsgiivAlivOvpWDQy5p+SUU8O3CGdRgelzWfAzjcLIokivIagaSSZFlddf1uM
 pTZe0gBMenT4Ivj1BuMrlaHzhpye3bZJ4FI5klRucys+Qedod+chHt/PN4jUBl21
 reyNyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btefc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso9404881cf.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102005; x=1783706805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=;
 b=N6ZzNlG1DGoumsYyBQGG0gcnh4UhvHZXJ0JCjd6jowSAm+B04JyLAB7s8RMcN3gM/Q
 gdQul/hk/YL7F8VmMdONvwocA99XS+0dsvQZgOlI+6HUyvzeuwKxB2ohjiIoZBuuoL+k
 4SCABKJCasANa8iYIYMc8ZbMHrsbl3eb2wUF1HLUKzTY5EupwFDjkV6wkWHpNCNu0k0S
 DdUvt6ixlBypYq1vQLCKhDBAowxsGk4nKxNoD+2ZXAB7oJmJ+uPzMdZ/7SOQsNJ5cNaJ
 HGCJXZuiP2A4bGi/S9JUsNBeDyKk2/JZbcgmop9hFt7BXeTGpU028POddbalNr4aQ8FX
 VXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102005; x=1783706805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i5CvciT5tad7yGydRdWyMF8oIxQptsq2RqDK/Jr9Fwk=;
 b=RSNVfdwfdFPJ/UtAt5Cstc93nYYUAaacrwqqsqSmuqSd4BMc79FdqoiI+rkwWRrDEe
 vn6RcRNBC4sryfvb2ZKYObiwCTwygxnqTXylgRlr04cc/9Iiotw+2he+wRO5W3h8YAue
 gOg7QOpEe9zspMgUorlhTUJW1NNV5gyISVu1hXM+MOpsrn19rSjCtgQTSJwvAlwZBJmC
 VFmtCXLlgQ7X+RPgET8melxEnARAfknlm2/79A4p1ORxbgezX1n6S2yqJeiRhr64Bpl2
 HqCG6fZmL32r8SiwUfMTLoSlbpyGMnJvdmztbjvqm6zJKUIuLyomxBnXPbQuOWU+7Oa1
 u7LQ==
X-Gm-Message-State: AOJu0YyjOvHrDT0kQFMtEheaGryy8PHovMw5sMmMyS8pgTm5wRyaW0Cc
 EuxzS3wv0Hwd1EZC6Dv58iia2IzH7S4MR+5LLc9nhBq4lWCY2cy60ydP6Ca3tqK05oVLf6HvKBM
 dWpClQE4+LWVdNthVcncmIE/CZIovzAZhq1+staJdUrX9qRBtjbTteBEr1w==
X-Gm-Gg: AfdE7ckvez4HcvCydo2SabqyL6gYmMG+4uACyqklE14xMVYA60CbK/snkY4UzzhCUC+
 VgvYd7adGVc38QnL2I4Urvyajlzj+8Svb4OzV4S3Jucz/vlm0rrif1flfPB3wXjtd1ULAegwPJ7
 cubxLBGAKrfn+khXCdIV+7m0C9ez1CuyVvpctZcNedWjMQuRtWggW0/GGrUmF8yLW+GfQYI8YKB
 vWkA+wdUQvmXfeUPKRmAOG58lKM4Ui6CW1lTuNjO14zGP9CsUWGuQQ4ZM281EJKgHcgG1nKkF/c
 z2jBMg7RJ231sO2rXZMKn9Bc6409HkM5I9uXLx/SvIuksshuBSPqoPmVWHu6rM9j4tMutUo0hbG
 frbqm/qk2tye7R30myoYRUsZqUwEZIs4ky3Yi36PKkATQDQ==
X-Received: by 2002:ac8:7f88:0:b0:516:e00e:6868 with SMTP id
 d75a77b69052e-51c4c2be172mr8920771cf.46.1783102004486; 
 Fri, 03 Jul 2026 11:06:44 -0700 (PDT)
X-Received: by 2002:ac8:7f88:0:b0:516:e00e:6868 with SMTP id
 d75a77b69052e-51c4c2be172mr8920321cf.46.1783102004068; 
 Fri, 03 Jul 2026 11:06:44 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:43 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 20/24] target/riscv: move riscv_cpu_set_rdtime_fn to
 riscv_aclint
Date: Fri,  3 Jul 2026 15:05:32 -0300
Message-ID: <20260703180538.3346781-21-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX6vC4EWSj7hlN
 UJYv11UXU/J22COq+l7tHjNEezsGOpZxeUergyQUMTt4ed5yYlVoRjj9EubAwACqchLnsd0kkrt
 VKZWhslhXF2Pm/E8MOaNOHBlLv3sbZGzWj9+R3wQJEPvj5guhdCDuW67q+cnMqUDx0dN0pgtLfu
 UAGwGiMFTlcQ6KgEUlWXdV191jN7wMEiEJdcYMmL7M/7JTESQe6ZEIAKbDYIUDApEAb6SGKGkYa
 T9J5Ntd4/gtaO5HycAg6PeWhSbfUFPGPyhJQi7cE0333ga77FJtj/pPZePDUrRNS8SqR7nleijG
 XCsuL7Hy33eAab3zUHeAIu89RfNiP3hd5OFPFoskWLdru4KkovJSUi2ae7rhIKhrZg3U7ZDxYIL
 wfZr7fgaBs8dYOH6q0KsVCH9bNrkO+ZiYvv9pYrftRaO276iw24NgHbcT0MtmLhxNeOm5zB60qI
 FzJDlBetLEAhOsL0YEw==
X-Proofpoint-ORIG-GUID: azvZZkomvAFqhlEjmzulGY2LVvNWZbX9
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47fa35 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=u0cZ2EjT8PS4VQJ4ig0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX5PoNsySZ5IBl
 GgkzE5apw6kzBhumEqkhVNaOE4P7cMJWgRW3xlKIs4wSDz41iyiP1fe1Wx3Jd01gc5AtykbKYRN
 yFQJbEUeib2qkMOqjF3r+hcG8XsaaFo=
X-Proofpoint-GUID: azvZZkomvAFqhlEjmzulGY2LVvNWZbX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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

There's no need for it to be in cpu_helper since riscv_aclint is the
only caller.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c        | 8 ++++++++
 target/riscv/cpu.h            | 2 --
 target/riscv/tcg/cpu_helper.c | 7 -------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e27e5fb394..361a8d1bcb 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -40,6 +40,14 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
+static void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
+                                    uint64_t (*fn)(void *),
+                                    void *arg)
+{
+    env->rdtime_fn = fn;
+    env->rdtime_fn_arg = arg;
+}
+
 static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 396d9253e6..d6c5d6c1db 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -682,8 +682,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index aded995a7f..7a1ea53ae7 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -612,13 +612,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg)
-{
-    env->rdtime_fn = fn;
-    env->rdtime_fn_arg = arg;
-}
-
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg)
-- 
2.43.0


