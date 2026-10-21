Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3E60A3833
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMvH1mVI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnopNSdV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMmh-0002cm-8x; Tue, 20 Oct 2026 23:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmW-0002ZE-83
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmT-0002Ny-1L
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:23 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F1742562962
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=; b=UMvH1mVInE7egOyp
 LnidU6vMzxuSCrLx1xTZBuHUvFBw/MK6VGbnvnWTRJb+Coz1wbH2w6NzssU1AVwV
 nNld6lr+s9mjLHdg66ovZURCaMFUNnv02CrvhF8ITUyJivz/uLJcOy/KwZEJD7Vd
 L5r2+w/imY+JM7fuBUnBNl9YZINZU6VKubMqpS/T+KYo54UK7naux3bf9iNhrcpV
 OfgfRaIG34rvCFcBAxINtCYZASd4PU+gfjZnavkDNLct28z+X+tc2YXFkfF9Vq+Z
 t/ymlnRP5mR4ojr3PCwMvZR2G26YgAvSzTWS0IHQT9JcjrpVPXunWINr9HC3QqJe
 npq6OA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd23m0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f54f15b9eso68987185a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552458; x=1793157258; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=;
 b=JnopNSdVoD6Jye76AggEfuGYN3ooxl8YQzDTsrY+exi82aCjCf5TSOcwxwN0EY2gj4
 Eq6Cw+QgaScday9QVv1EFn4+uQvysJlrrTEonaR8Cy4joZhA8Wotf4plX8JC/N2IvL4g
 gJCg93hCGHd8gpVyhNl8XnOl48l4QmXA4SV8MSWnNubxifzOSrGAO3u1Niu/bxJsMhC6
 H5Y0tfnxeC331AVAFE/ZCOEXKj5vMTIDUMLVIycYGoPSCub4tCi18wAySIbwASvkZUue
 wwGFBhQRri1hrACUmCLA+/00MKx6L47OMZSWlKsSkgjyI65Rq+YWsi5/AeKoF/BgPl6L
 D2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552458; x=1793157258;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=;
 b=kKsmI0M/vLXVyNrAM0Jwzbow7izIZXq5C9beQ16nbRe+kMIuHPR6+yMWK7Csbg1dqp
 c0ssgls7jY/p5Nlv3AgwItUGBExl9Y8kvBZQ4JX/aczp92H7CgdVjx9jMEHRNvGeLoR5
 P0s91XgVHfoF5/Q2hRlABiWkWSXXTutzWMkVM//L08vg334wHnTppLAdsN8qwr+KDqDb
 P0w7L5B7lHOttJTGJ4qymP+LOHsLV4B2KcWFr1ytR61TTXTMf7fZJhfq/ziK1MX8AYzA
 z7BuW8/y6+8eZcQnIvcVMUlC3gwmdTMX4AmOMQoWWzqI5po9kCgCJ4mHawPxbzHKYapt
 aKVA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzKA/6k2ZaYKlexYFdJMZedhKVzjeTazAHOa7iLM5HoykeJW90tXzDQBKKjboLy+202/QgGyPNQ3Vln@nongnu.org
X-Gm-Message-State: AFq9FYIbLe3NiFtvMbWtfHIjcVY26yNku9xqtu01iG2R0NSacuHysErn
 WyqElZj0d30TwOgSlijx1y5eNY9vCURb/Xf67PvQZBvfvXtjC/JDTvA2ObMxItzvdeU4Dz66Ezo
 vXC5bpX0UweHGOfSykOtA6zjkvQ312aMoSmsKEQ4+yQdPvQ783D1/sZawWQ==
X-Gm-Gg: AYBFou3nw54iQPqGhuNqoNJoplQHNjhXW1pAT6NI/vqRv+nlWsSU9kBerSM9/dxsEJZ
 zlPvlFWOAmBG6fHssoq+tJkcgV++VP9wMr9qZye6a4AnYU1gEOTeFeJrxGjmcvJXXpWwnFOJhzd
 BNkVBFhnpPQwt7jA2HSk7Ymc4tbxUCAbfmSui31+POlOdUXIcbD6r5UQKBgy7BOzpoUtxqTvkz4
 scd6d/RkJBKL8x5kB5S0i4Uvmcmc1Nn7KQU+V4IdX6sa+uCAtiNVb9JO1RH/AIoJTeB/7iDWPaQ
 NGltqkIhfZAX4YI/sJvW21QwZdmWWqUjWYUEuTtiJ5UjxyJgZbGNvDmR85llA/U4LaDdbIfHdrf
 Bmjcg4XSYr1eQc4i65mUnWAiGmhiAI00ngBVJ3BMN
X-Received: by 2002:a05:620a:4503:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93f57e3ff66mr224713285a.5.1792552458396; 
 Tue, 20 Oct 2026 20:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93f57e3ff66mr224710685a.5.1792552457898; 
 Tue, 20 Oct 2026 20:14:17 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm40861235e9.12.2026.10.20.20.14.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 01/33] qemu/osdep: Add ARRAY_ELEM_OR_NULL() macro
Date: Wed, 21 Oct 2026 05:13:34 +0200
Message-ID: <20261021031407.24862-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9UQ7xIiMG1ws
 n4qSywi5Cm6ETqduq6TwKXxGeZWrbZWBtDZPgiUrkq4TpKAxTkc4URvxZArCgBaFuw8fHxPjZbj
 3dYV3s+uilWaUTcMCfH+XtHOa542u8NLkgAGG9kmagIGxS/uuFrqZ+PQa4kuNqYby2LSO8BE5Ps
 ZUyWLSuvP6v6zExl3Ribo+iRbg3pS/D3M7sFFgzx0A3x0dZ9dR/q9iUhoFIGhprx2eQU4Jkhpan
 32+VtQKtDS1YwCvgfewHHcocKHz9sOp4si/wX7//zfQt0gMuvUwoHFegV0JSrG5lYplhXaNc6eL
 kywLXWUtSLCeOXtdtVfi6H4wHui0BIuNrbso5mYHOQsP8kSjMHTkVT2uCegmkuMYFDaCFTtYN+p
 HZ9HF9wp1IDwx159OuLNLwkAHo1nS/ITFLc5vHT91hVm3ZiM1T9PjD7RIWbOscdtBPdnh2Y64Sx
 ybUBNMiPUQ2+7PGkdGA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82e0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_sJYpoIm5FXuGNwjPgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EvVXgJpMbaIeESxBaMVfFPBeVzeSu8jQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9xOL3nEIhgwf
 RbS3D8CHDe2d0wR0ISjVJaq0XBeZEXKEzQz/KmPM0bQ8w60jTHc/tg6G8gSYUz00G30KlQpORZv
 9szKrm/xsQY2lVoz2nFKIdZPmY17yy0=
X-Proofpoint-GUID: EvVXgJpMbaIeESxBaMVfFPBeVzeSu8jQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a macro returning array[index] or NULL when the index is out
of bounds, useful to convert switch statements over enums into
static string lookup tables.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/qemu/osdep.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 1ec5b42230b..993c8ffde0c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -533,6 +533,18 @@ void QEMU_ERROR("code path is reachable")
                        QEMU_BUILD_BUG_ON_ZERO(!QEMU_IS_ARRAY(x)))
 #endif
 
+/**
+ * ARRAY_ELEM_OR_NULL() - Return an array element, or NULL if out of bounds
+ * @array: array to index
+ * @index: index of the element to return
+ *
+ * Return @array[@index] if @index is a valid index (negative indices
+ * also yield NULL), otherwise return NULL. Useful to look up entries
+ * in enum-indexed tables without a prior bounds check.
+ */
+#define ARRAY_ELEM_OR_NULL(array, index) \
+    ((index) < 0 || (index) >= ARRAY_SIZE(array) ? NULL : (array)[index])
+
 int qemu_daemon(int nochdir, int noclose);
 void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
                           bool noreserve);
-- 
2.55.0


