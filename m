Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9296C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:09:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIN-0002dH-Jv; Fri, 03 Jul 2026 14:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHt-0001hn-Hc
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHr-0002Lm-C1
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:53 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiFGo546492
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3BK6l7CNgDvswOy1LpRrU+K+UWVw7uqj4vj9ahAbVOU=; b=g4Y3P3CadbpzHLzM
 jJk1TWEegdSCQKvPKsBwy/eoOjZ/gmTzxRj+SuOa2SFLSXNzI3DlMcs0p5oLgXMS
 CoWZ1CDlf+ODEFXCnjLnW18afRS4jNgxJ8nPbP3FR2h0ti44bBFzdpDayKOz1VnA
 ev9xwxpJhGthBJoBgxzlXvOoxR/JAKdUatEK1efa57qAfrfUBwhC8SjF04XTMv/+
 aVy+y96VC/eOtjBrzY4XGt3T35+nV6TNcX2le1/lryUCibgkPv80RCkIzsPZglh7
 NCVM8FNcyYQyCmJKCEb/XQXpRcaedmBAvqZm5dL16ThS0hz9+YNwpfO5GxK43EEV
 ldXSIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02k28-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8db414c7so10853111cf.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101999; x=1783706799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BK6l7CNgDvswOy1LpRrU+K+UWVw7uqj4vj9ahAbVOU=;
 b=UUk+YyFsPKJFL2WugJDKi7GiagPIWw4q8cjLavlPXgMG9QXxnM3OJGfLZiu1eV+F4a
 qixSUjuXXecVcj8YdIGI8752fTTbaQCkLXc1fWT/VmgHXDk1NZJ6wYlaQteBp8AtY05g
 OduJtg2ampK2Oabkq35cwUcikveq/JKyxtgaowu+n+fmPV6JX7Fzih13nC3cipiV8Sbl
 ox2StREG5TFsnhMrUw12G+xNSVpIA+ew3IEYGYPmfvFzfwtqkBB5w09jOcRRA2GU91lh
 va8mm/TQwNIu5vo6PdvTFVtlfm7Oiwd9nizBdupvOsvOh36z7mJYfDhQoKy9rdh8RPAV
 ECVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101999; x=1783706799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3BK6l7CNgDvswOy1LpRrU+K+UWVw7uqj4vj9ahAbVOU=;
 b=LWDGJPaTg9z8LHedX13z54b2L/bblqt/PRICG+dgEbHOvqwxu2jrhSj9PdsGitnevn
 JR8oLq4hL5saOu8iCXz7thhSqTuswrgvg5T6PmlmzpSmlFp1lD5eBn7Orm0pcRjT610M
 nIwb4pcRDiq/0AKhY3fjE9WEkxgoi2/4lnr9TkHyPFu9y8C5iWjxtRsTvG5ZcpeyPx7E
 3wBSyDU39xbPtHAEPNBVdjaTpYfxlON4YHzVRPgsfcVk7xejPE1YIrZ7DpaeQGJszFTE
 Xi0/7zDObmOE5y+WxwUgPUzV2c38x/NfxY3XWmKyA/wgvXedecoKUxqV9VRTkMCNS1BE
 84Rw==
X-Gm-Message-State: AOJu0YxF3POTi5vWoeCWAXRNhIvl+7YvrQhHBpTSo3lFKkVDRi2mR4WR
 vweZA8XAxMSb1mtJg6e8bzMhSgV1oLWuVtBCx9dYzopS7JSL6cEfjBtfqLuowvBHiW+zTJS2EFM
 JjLdkzEeKcjQwKS/+2MdIU5xlMxGUvhEABFpdNrYO+aSohNXQttlRiQJigA==
X-Gm-Gg: AfdE7ckJTOlsDD8UqS0pzLA60f1T1UZAkanXknQCd1MnsutyXnxG4nZD20iX8s2Coxk
 iDp+HpopUiy7KWfZbjnHBFlV7ZGRNtl1bwwhG4buyiYxcVjkMV5aUtu2M0SWYp9VvH0C1DDZ4MI
 +UGSRD1LxX4eZT9cQtqdWuU65mkVRxUGfW8mSnfSmKqecKqdAdcQOWrpe8qBpPuI0soSeTq3htH
 gQCTDLeu5XA6UOoDvfSYODoE20ly43cs6yWzZ+9SC8dTIpRk8wSJFiRMwAdw3LesKVyU6XmL5Dk
 ETR/kHDrGRhTD0O+uJwGhOGXFY6PjQekurilQbgFg4RgA1rZzWhsSRW2DSVGBIKBTewFeDy/8Pb
 b7hSehbcqB7MrUO2fbvf9DTIVoqsGuB+dxmGSQk5789WGAg==
X-Received: by 2002:a05:622a:40c7:b0:51c:c97:f3b2 with SMTP id
 d75a77b69052e-51c4c3edccemr8479631cf.64.1783101998758; 
 Fri, 03 Jul 2026 11:06:38 -0700 (PDT)
X-Received: by 2002:a05:622a:40c7:b0:51c:c97:f3b2 with SMTP id
 d75a77b69052e-51c4c3edccemr8478921cf.64.1783101998234; 
 Fri, 03 Jul 2026 11:06:38 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:36 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Date: Fri,  3 Jul 2026 15:05:30 -0300
Message-ID: <20260703180538.3346781-19-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rPIUPJoC3-yIuUB2K0XMlhs7QtbggzNR
X-Proofpoint-ORIG-GUID: rPIUPJoC3-yIuUB2K0XMlhs7QtbggzNR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXy8+HUAKE8TVr
 nr4E/YPQOa2gO1Gh8XW4URfEgmZYD/I3shMtkPxRETm1W6BdtHLLGkSIH9DiXUxklEnJ8iQUokZ
 oHQxgYqLpDgrSewhH73YFhjq0lHf7Sk=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47fa2f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=0nQI16K_ZF54athspwIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXzQ2Jw97gk8vr
 7MgcPRBxBBoQnEWQh/D46AsgmAcJKPLE/ztHs2DrDelP1F3SEGI0Jt/9KI3izr0zpsPpqs1T/jR
 VwDhyrqzZHASzm7oAYrwwxPgnXgDO7Ttrrj6VhsOyJ/jJNqwQu569+5PV3gzXVdje5HUMcRieIP
 DwYR3HVjHFfrBjfefK2xzDZPYOB4c9aD7Dv7hT4ZZgbuj/rSEIulKrHUby5NEwc/knOeIW+7X8r
 lRu/+B9QWzjfwwkuGUjZIr3ZOKSVNGoWUhzRu2VLA+N1gXFAxr56FPPnWNVbY8GI9TXFK3OeIGx
 d2Wtd8FsKM7Tgq1mVqkjApz60vax9sHHYEDZDqBglTEOxT8NGB6NSQv/fPexoxUIaNoXZfM7Jt+
 0byzZYoSZ1nHw57K8caG1SoVYN+SKlNpp+3lAkYaLqsJGevNpzMHBOCdpkgZ/rkpPf1DioW8hi5
 ooFdmWyY4FZmwXp91qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
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

riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
csr_qtest_callback() are all TCG only and are not available in
--disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/riscv_hart.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index d1c7188369..747754be61 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -61,7 +61,7 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *val)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(cpu_num));
@@ -151,8 +151,10 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
-#ifndef CONFIG_USER_ONLY
-    riscv_cpu_register_csr_qtest_callback();
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
+    if (qtest_enabled()) {
+        riscv_cpu_register_csr_qtest_callback();
+    }
 #endif
 
     for (n = 0; n < s->num_harts; n++) {
-- 
2.43.0


