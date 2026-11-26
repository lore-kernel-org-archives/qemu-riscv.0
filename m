Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4F606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0XnD/BH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWsP4l1s
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj15-00043Y-QD; Thu, 26 Nov 2026 18:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj14-00042N-2Z
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj12-0003nq-6c
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:37 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvvSx2573554
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OD9CMOtntKdYH51TLfzUuXfvCfmzFXt1EcBrUXIZX9U=; b=k0XnD/BHXKp1alSZ
 kF16ZxUh2AapblOzWv7rpSNL5I8V4Hqk6dvjYaTanYVgTRrDRf5DfZKJa3QsfomK
 eP7L4ldBsg+HrYUWez60eXRNJqZTXjqUCDwjjRYmsjw65ijK8UibLCBBF1lSF3fs
 +50d0ZRzZSNrg9EG6leXLnk3bsYb5RzS8sQxfDaiR41RqDsPnQYaBg7f5ouxwRYW
 YEq67qCN0wwMptPSJP8hPm+40jI3c77o+T+4V7OMT8aka9JoRlpXpThj3vyAfMuC
 84wtvkLL7yPxdTZK6Inaytva7WxYxp5eA2fCDyx0mCtTOM2/iMUg28JmuVlEmwAn
 F8LjQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u498fns-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so1360654385a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736183; x=1796340983; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OD9CMOtntKdYH51TLfzUuXfvCfmzFXt1EcBrUXIZX9U=;
 b=dWsP4l1spPkWUEjrM7iIWDAfxZfil5RYbmz9zlYWqxHmkkcQQJazTUrphOJIYTHITV
 96ia02kCiDEsH9A/qDXOP8ngZb9BCSwFC6+Fmh8cCTtXsclekkSHHvpEe8a1VxrtFx2y
 7KDmLXgRNjfoxpC+ZmyuCgTgsEcwHNI1l+WF34G1bNZ6U47J/wlFAO+M8lDuthuqU/ig
 R6lfx9vWgC4FbLmhV04p0NkvuguZPP1l/Ot1KpXuspprOMjMH9srPXlmU/WbQPfYn0IX
 A/PGda3PEtD6TGQ4PSpHYoJPv4bN0Shb41+PtjwKhgmvRXILoM4E7mkPZTVxxIPK+d5L
 /hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736183; x=1796340983;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OD9CMOtntKdYH51TLfzUuXfvCfmzFXt1EcBrUXIZX9U=;
 b=n3B7IVs9V7BOoWUzxOz3GEiigdxr3HRQC3cQUTpG8y1Ao6irsfatpnM/O0zotRZagi
 tNsQzkZnMWPuZdTBeXNJwlKYS5delQXXnaLUg4SpMZAWMN4FMuHEXp8Qq1kXMmtahQF7
 8YqU6G53isxfCBF5Qta7MQxBupnJRxkkE4t2EdfrSR8a0VmZY+yvZQuNKRlyQIBK7dSZ
 a9Q9CRElUrQh8Du6pOCYIqNXeM5ylHYlXXPsXbOSiCRWAqNfYttUUBtfLpsl4NSCX/3N
 /xIDAkeTMT43GRhEkfIDdMNmkH8m6boOflIR7ol9RMqZj53Ucc9w4FYtLgk/nTcVeaol
 0QDA==
X-Forwarded-Encrypted: i=1;
 AL+hErETu/telHJsMHHe7L8EtOsu5o4HZNUJRaoux4cVGWupfIMESxVrZI/rwa2Ryr7Q8IqLw0VumF67zAJT@nongnu.org
X-Gm-Message-State: APuU4Z+rh9XciUNmjyKwkUjRgxBEwL75B3khr9+8zqiyit8ChUnXppBf
 mICnymGyqHV/KpnnM35f0YDx1O6oTRYXllMJ8Pk5strz2OaPh3pqtaEe30iyPVKes3HXA67IkZ4
 PxNhX5EZjOxQb4e9sJjNa7D2kyT5XyV/1PeUoVzUqVMcT8Jw+BWux+vJxAA==
X-Gm-Gg: AZFdTZfXQrFwx+dOY1K2uIw4UVnpdP4HduyM3elz2h0/zy6vrK8saEqu7ivsUKYSZa7
 Px2Pw4QVNKpQbN041CWfx+c1Jqqgi7dfjcgKAiDyd9zrYYzvDh6/CUfEZ6dhzPpsJmSklKf00Gk
 ZYiUGzgowPsJ8d6vYgw5Wkw1u/k8ZqaE4m+Eg4MgAWT/jhY6acRQTpdNyxa4/QGAiOx/fu8rWnC
 o8m9YoMZDbW+O66BAzAET7mcpyDoUg4+nQfzkOXyVdC1bZ1Ipvxhw9e3ZOyW25mNiEJ1FkPKFTI
 +Er6vO5DGTGY/rA1f56OAq3jSPi5Xw3uyMxLvAqr5GaPBtGaVEIOpoxOulRJoAoarVDay5JldAi
 aAd5XxKAVpHfpg6kCMBouBjUjSblQuy1rrO3MZ2d+6IA9+fbOybLWk9w3hbV9ge3QgLKOY1jHFg
 XVJtGIBVBIYRfd5g==
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id
 af79cd13be357-949bab480dcmr3786830385a.80.1795736182768; 
 Thu, 26 Nov 2026 15:36:22 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id
 af79cd13be357-949bab480dcmr3786827585a.80.1795736182324; 
 Thu, 26 Nov 2026 15:36:22 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm699284395e9.12.2026.11.26.15.36.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 02/24] accel/tcg: Update stale TranslationBlock::jmp_lock
 comment
Date: Fri, 27 Nov 2026 00:35:40 +0100
Message-ID: <20261126233604.67722-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dxBbzUZQUvIc4Lrq0lNqAiSZSWT9oXu-
X-Proofpoint-ORIG-GUID: dxBbzUZQUvIc4Lrq0lNqAiSZSWT9oXu-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXyC8Ay/66dKoR
 IrqwGF2Pw5xWXibdrvxlEK9pn1UfDcgVwY8MfHwcl6UZc8IgcX+HQ7H58JTy7bbmdtbjm/lzChi
 jsok2QSSFT640HBLWrOuMGAELdxBtpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX9NZXM/3bEVly
 sDNJns9ecOKnKVvOgrjte37p2KqFxfy8CXdQ+nSG7pQR12kVaxSCR+rVf5VVfroTCwH3u03KlQl
 mWcOVFlRnvHaNKqDCF/0XqjrnFsOuo6wX5qdVIg+WWphoESaQ4pe+TOc1TJ8iJZmVZdzCiw0Rhm
 HxoLi3niGfpFvZ5Rpp75lilzABboYw2ADdH7twlFbd+qQcIkN2rarUBKPnD4kNHP9iSG656kPRL
 q/5lJasBLNIE32G7DcVgfOarYSnObEuUveZxtjjPNUy/5yErcVjatlYjOV0/gkZE/5wJ2vqARX/
 sn+d/AlyOM7h88OjhwP+5B2Um3lvq3vbqib6q8jEjUwCQRsSizQ7vPfkAL4cYCndjCYoI9GmqQz
 TkHDXklALZtwqZFKOB/LvxG23VAcx8bT2RcbHLPyJIUoHtqxF6QlsxgG6Y4KPUHSHjeOWV+pQDf
 7yclr16z0w7yUPflRlA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b08c277 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wor0a0PqxOc_1PWZJ9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jmp_lock was placed to fill a 4-byte hole, but commit 9da6079b2695
("tcg: Add TranslationBlock.jmp_insn_offset") added jmp_insn_offset[],
so jmp_lock, jmp_reset_offset[] and jmp_insn_offset[] now take 12
bytes, leaving a 4-byte hole after jmp_insn_offset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/exec/translation-block.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 5a7a638b087f..f61e8e4ec0b9 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -113,7 +113,11 @@ struct TranslationBlock {
     tb_page_addr_t page_addr[2];
 #endif
 
-    /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
+    /*
+     * jmp_lock, jmp_reset_offset[] and jmp_insn_offset[] take 12 bytes,
+     * leaving a 4-byte hole before jmp_target_addr[].
+     * jmp_lock documentation is below.
+     */
     QemuSpin jmp_lock;
 
     /* The following data are used to directly call another TB from
-- 
2.55.0


