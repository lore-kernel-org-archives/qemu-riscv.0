Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901FC606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGuKsmEh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdZ0f4GB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT61Y-0001Gn-Qs; Mon, 16 Nov 2026 18:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61R-0001Du-Km
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61O-0007X2-SF
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:01 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGLHRiV2246568
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IOhpZiCpqaY
 nKSsE+BPATiYGVJq6NbBud6fgy8i1mH8=; b=ZGuKsmEh54W1iN+gcupozitRLEz
 aJktOErICVBKxRP9b5HCPlHxBnAILCtzSX82I1KMo8B0lQUiY9NhuwMVK1+g0BHo
 MYlXFVWoo5B448FN7/RNlW4gseT9Q7xr6FWjWD6wO++wTAzl0ypQfbwQs1YZbEij
 aZmtDKXEELJ1bybJN/cwhJMlKQSiK33RPn0qJ8MgqFu/GiVoAgwJ61JWIkiC0TW1
 pBITITVSj1kWJGcVWHBEk3mBmR0ajOmhoRAEX9YO0T/9+ZL/5A9/yzWLsGNgGEkp
 KglFfvF+gO3m8srq3eh18XquN0XVchEWKk/MnZF7rinsGjE7RNyAv6QX/Kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m08cr9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3b18165dc53so5732704a91.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 15:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794871317; x=1795476117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IOhpZiCpqaYnKSsE+BPATiYGVJq6NbBud6fgy8i1mH8=;
 b=XdZ0f4GBv9i2s5E0nOfPguNBPGcUanI8KYnzZWZ1uzIf9z6ukY+V5pxguEGap0RwRC
 h5u3YTy5eLf4j/SexwezAxcmgXH8pYJtebl5CmhobFU4/7kTToe+rR4r+fJowm078Mrt
 PRTjIjf2Y4akUDUK7UFaXnxEKkcsCglEok0svPKfw0z9Y2S1qKgbqnYrP83phltQRa9m
 GYo6V04d1noTAKyT36nbKKj+xiWRUzT3Wz9wQ5aoQ2g3Tw1hMwR7jrO2iIi8TK+YTn+2
 KatpysqLBJVRyuV03CJfdVc+SwocilW3AuePLSPkpm7XI9a3PAxBAljfMlPZOARo4XYP
 Y/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794871317; x=1795476117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IOhpZiCpqaYnKSsE+BPATiYGVJq6NbBud6fgy8i1mH8=;
 b=cpYm3M8Z/LGtxjBmt7jP5T5QjDBSyx4wqy6exJDVnQvXWLhjZjHz5YbZN3RCEFjxbV
 bK2FloZILGFzMrQUBHvj3d7djzS92rans7UXV1CE4hc6VlxrKC5y+mX5nQbipAtQXddX
 r/64ZOS9MIj8J6FmIJAWXVa2D0jqJRGcUwbbWojgBHmsuNNntt/V9FqDkZTOSGvmBIld
 yBlTlNGG6yMTF/cVy+aDUdSyqrDHN4zQ1bKBIUwZgbVBz8Q5lHM93kDfVvIvn9+2syog
 FREvzeHq0SlJmdIV1ikBkkKTjSsgoZsXM75Qqjy+S0BhV0R5K/Lve/9wPviLVrk+RrK9
 lwpg==
X-Forwarded-Encrypted: i=1;
 AL+hErEYinuDsujVOChXIhTP6o6CsNkx8Psyc9biIBSyOsR3NEsUhzM6r0N9twkhT6pQKrGUvJjqjEnWr2wD@nongnu.org
X-Gm-Message-State: APuU4Z87EmeRlWrLgIlHF1UanjWUNtB8LUatrE934ZghvTGUFSyecHTt
 Ezy6wK9823AnHNBxRrn9WR1VZhYFoFx6Moke00joD0izAgn3h60VfIJEJ9WzcCBCa0RE0cvMaYG
 Zk3dAcD952g2Yefuaip0tIDA39KShRTbtSsUWHTEYhl2Y66fSJGBemMvYNg==
X-Gm-Gg: AZFdTZeRZ4t1fw8IMMYVMjf7wTlR/8vNm4hpSz85bmuRar5K/Wq8dZE/jvqnAkeWXL+
 0h8tshU7p7YxVmzhXkBqwDMJlI05r0DZ5Wcr65BFgsHql4jKIraBN32T6kXLyCZK59ObGvY3eAM
 Pc5Ev6Hu8xaJ4R5LKpibpBrdUtWrt2uBttnDR+xDxxF9adLHoSaIz948xDNXFaxcVFfEmVtWxFy
 UG4F7Hj5trtO6CIAYFynrw1qFd+R5qJheLv5lwfw+WpvGU7MUGA8Yp03W8NeVARrTJ6VUHncvfI
 Lwax1nAUlwD0MDRxq40FL007m9VsjmnO3i7sMJeXf5LJAvGx29katGhF8PQbUKBLQic5JjRg2YS
 DOcmWNLLnw6iMZWTT+yYyH+AUtR5/xUrqVT2QNJzy4DVMv1Ze0OG2GkLqo2oGqyrMH7c0GjzDSS
 vQzdwV8otWV7CiN7DgCTGd20+9SoH7ZwJVg6jP
X-Received: by 2002:a17:90b:568f:b0:3ab:b39f:41b9 with SMTP id
 98e67ed59e1d1-3b1b0b5000amr11114325a91.61.1794871316822; 
 Mon, 16 Nov 2026 15:21:56 -0800 (PST)
X-Received: by 2002:a17:90b:568f:b0:3ab:b39f:41b9 with SMTP id
 98e67ed59e1d1-3b1b0b5000amr11114303a91.61.1794871316282; 
 Mon, 16 Nov 2026 15:21:56 -0800 (PST)
Received: from pc.taild8403c.ts.net (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b3abe77179sm1059550a91.11.2026.11.16.15.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 15:21:55 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] tests/tcg/riscv64/system: remove exe_name as it's already
 the default one
Date: Mon, 16 Nov 2026 16:21:39 -0700
Message-ID: <20261116232140.2758664-2-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
References: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX4/edM339et4o
 T/XVBcbzu0FgnIE4E6lnK0XW2fTwME0hG2oMwrdVxQBIdyrw7aZPrbg27/yk8NDxpn9cvZaETTU
 +5UuGjcVHHt46gHsDpeSTOpCLVfBRNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX5M9ogoWcJES+
 c1gIcXZE+W1VS1XGX+aJ770LrAPpzHZHIrZZ3hkYR9YuEv5Ih1cdDBQ8UWpUjLCdwKa0SlWGK6K
 Wks1LFLUTTRDh7V2AB5F4sWK0z4w7IpXbArOLaQDNnLJ4nOb/9hmu2wv7/5xzRxbjQevmsTEqMv
 mOnpLKmkvZa/ATdAlkXT2ayU+KQ3rbPUB6AW6FZWC0wKvUy1cK3NlDRmXnpQGK/R6TSO4+8ji2A
 bvoKc5J8H/NbXO2eA6YDjprTwM8Rt+0DJuXEAMU6LMVDH6ZkvqcPgpvsNaDPPWlBY31iaztXi1r
 fEZ+hQKDveMnGorsfFlLGkogtFsAMXt/mR2UK23yxpb/xgzxdHVOATB25pU0n+PijaWgeg8Eo0O
 AcSJB1ba7tE3wAUZu77FlS32iZEcJNbkwtYkJPWivuz/WpBVIii/HTlYSf2VH/pG+Q++Hf3frCy
 ouKFZlhql2rgX83wjCQ==
X-Proofpoint-GUID: _QuGYs4GNpbt2TgiIHJdkft2h_Xu4zO9
X-Proofpoint-ORIG-GUID: _QuGYs4GNpbt2TgiIHJdkft2h_Xu4zO9
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afb9015 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=V_hc6lPSFJMs_eCW-sAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes: e723a1e16319 ("tests/tcg/riscv64: add sdext "not on Debug mode" sigill tests")
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/riscv64/system/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 3c8b018d9e9..9edab1fd7ad 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -76,7 +76,6 @@ tests += {
 
 tests += {
   'test-sdext-sigill.S': {
-    'exe_name': 'test-sdext-sigill',
     'cflags': cflags + ['-march=rv64gcv'],
     'qemu_args': ['-cpu', 'rv64,sdtrig=true,sdext=true', qemu_args],
   }
-- 
2.47.3


