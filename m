Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8F606A33D
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m0iPV1Cv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esAF1zpr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT61o-0001NY-1L; Mon, 16 Nov 2026 18:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61Q-0001Cg-FS
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:00 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61O-0007VC-QW
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:00 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfCIe1573336
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=T9UTjdBRQMU+G2Bx74YX+z
 fL+IVC+D9CKcLtszSjWcI=; b=m0iPV1Cv2Yzb7Ed0Jnj/yF/4vzA4S7+Brx6gL/
 BvLeRXgeBgmHcn854l46oizrbZEuQWXfdAXV/MV6FzibjIPoiOLODRJHuqd9tstl
 i8lG7Nws8BNGP1kHmTehil+f4ZGu84aqLsl22/NPKJb2IpZLnuYzjFkgHa8FPIEf
 CKfNsGDdJgky7/0kP4PeXZqVHfOKYyLCbqRgVCrhNgFC9aXTaxdcCvDT+QS6o0Ou
 VoTEahZH2XrVbnY6i+fEPvxDFDQuCL+rNH9Ls0xZVMZHdobwS2Y4PKldqOmFUWtA
 hT7OMAkhbRDTL6LyDOhIcDt4JmqpxeS8OV25lO4w/qWBM0dQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgjysa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cdb8e8bccdeso1936271a12.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 15:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794871316; x=1795476116; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=T9UTjdBRQMU+G2Bx74YX+zfL+IVC+D9CKcLtszSjWcI=;
 b=esAF1zpravuc0E2s9I9Eh7AYSUsI9aDalkvtKKdPEs/hn14+MF13aHSZTq7TjC++ip
 th2QZg6970eX2AW//jLuEkLc2+fFuFypJGmP1KNn7TqL9aBF6PJo4Vcchqs3eqX9If76
 iLejngR/R0p+NwaCVsAjuWOccUK+H7FSZDAC3bWrkB5dUUZNvUKMMn4AKwdRFHH6+jgR
 iBg2XmhdZ/baEqSIqAK42UNXd7q8Lq6sIZoVF9/0UT0cobws5hbC8YGOx5efzdTb5tWC
 ISevWfCe4jW2Qcc5ZwCf59Yrj26n+V3484NhEp8IxB6u2iYZX1T1Ssd6FJ6wP9CusyoZ
 eIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794871316; x=1795476116;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T9UTjdBRQMU+G2Bx74YX+zfL+IVC+D9CKcLtszSjWcI=;
 b=LfFZdvOICzWVg3xe+/HtR41AhC4YjqyFnUqn7ean7hj+giRe/Of73Tcqr3dzL9UfBL
 KrIarqXF6tRhvDMyFR8O4Z67ZLxZd3QVU7Rxctw8NervF5IMC9bBHfA9xxOhiN4HmblJ
 jmxM7RrQx3UfoZXrH6D+vKhOW3eYebPzA4VOnN0fl8NWLibHkqhFl7W3cMBEp55vI1lQ
 c4P+BaCLBBGzo79JaR41/tInk0oQyhzdXi+eb6+sa2EBt7Ow/VK2pZ2pWAsFR5sh2UHe
 la7M6NyLonJaQuWSOwgGrxFNVymuTu+5/PIOOOjH9vsBKQ8P/YCAs7y84Io1FFZlPdXT
 axHA==
X-Forwarded-Encrypted: i=1;
 AL+hErEBLw/qtBwAa/7fDQqUDp/dV4xdtf01MK0HJhDqLZ4HlrdxMsT6vmUNS6dMzo85Evq/lN5zhymUvQda@nongnu.org
X-Gm-Message-State: APuU4Z/a8T3UdseSOsVNE1ZdGd3JDBevT3c95Oo1SahXvpIdfOwf0XuO
 15w+ye6YysBxQx/pS5jrgui/INe7QsN3etK8qMWUKTzmwVa1r5xtEwZK4O6zmj9qUHGli3NgtGO
 QjRHA6SZ0ccaasdkSbDGu0U+jA+FMOYay9w4TdONFJ2IAt+1Fmc9PgtG6cw==
X-Gm-Gg: AZFdTZfQy0kaSPHaw9xFvJegH8psirBdvsfvFFGdwxSluyvAl7rAx/0Q8tGcskCBIF6
 L4ZEVaSx/PKkv7mmHU4J7YSCcqun9wCUNX7zzaLuVl9ZugFknKKhSTk+hJLqAz2umVFdFZX8rvu
 yZubyk5+ZpvOKaIEL9b3j7kjGdYQURKQjfPE2SHXj9msMEtAm2PUxHLbczpYgFrH0PUMKJ+Fb+2
 56UCtv8WMiAlKfaekVJzPB9tk4ipIOBAWQV7qoKEH4WZ/B0oC+xguCmXPfEZYck19tdzby/GGlP
 k5Dg0ZppDXOxlofEHk4xzJf4jb7oSVW2zuFWnBVbJe2g1AunZqP2RtlAWXUp91MTmcRZr4SosLu
 2wGV+IfLJMSHRDqGAzoH17kvtv+c9vJ0wgwrQLplQ1h1p41+oAjOSxg0GXn7S4hr0+wdXmvmuq3
 4ug7hfpf7oxhA98MWu0hgucD9GFvE5yxweXXJk
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id
 98e67ed59e1d1-3b1b0cccea5mr10440134a91.64.1794871315904; 
 Mon, 16 Nov 2026 15:21:55 -0800 (PST)
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id
 98e67ed59e1d1-3b1b0cccea5mr10440110a91.64.1794871315430; 
 Mon, 16 Nov 2026 15:21:55 -0800 (PST)
Received: from pc.taild8403c.ts.net (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b3abe77179sm1059550a91.11.2026.11.16.15.21.54
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
Subject: [PATCH 0/2] tcg-tests: detect redundant exe_name/test_name
Date: Mon, 16 Nov 2026 16:21:38 -0700
Message-ID: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX7l/ha4Dh268I
 8W1ctgWDasJ90MaFRALfYSskpJxagXznDEfqUDrfBKAdlGa5iCxyDUToE6spOT/fsuKViUOYoH8
 KCpeWBezBu5XfFMvh5l4a/Lke0YTgBU=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb9014 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wWiGVp9yJhZXvw6-tjkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: jxIGQjeSLUrtqKxOSHDp-HlP7jErppz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX7E3NBx3Yg/S3
 ujZtI//qA4lXo/PhzMHgafeRYZq+2S7avS3nxTF3qy1AFZXdNb1At5JBpDr2Le5b4MYgE1FqxEQ
 Lg6Gq4i9wQXbGQul4dPHt+0dUoe5PMr7VSZGt8nhBaOHXIzgNULnu54sLpqjWuPUJZ6du/6TGE2
 HoYhEszyj4rB0DLQYGoVu4IOxECzqp1shpQ3w0RisruJp5xOKmS/rxfLkXK07OR4EoiktQWUGQE
 D7tySyd2kX9CDVZ1Uo4SKdnGaXKNGFijzHavFFvKdprNgLfs6SGM/KOTX2g9Xk0lo/eFJGOHIA9
 xqXnmui5WMmb4BO5wwT0z9yDO+2zNiquaw4r4UGrva2OKVku8kqaxSsinMSuJAkL89T/SWM/w9Z
 InNhDkwAg8iu/tZrD58ShSFrLLo0/7FlbFMG84xd3K+hd3booaakMaB3SWKd+HFSdZmbliBc/Ma
 YvbrhGdqGBtSs03VFKw==
X-Proofpoint-GUID: jxIGQjeSLUrtqKxOSHDp-HlP7jErppz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160093
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Detect and report an error if set exe_name/test_name matches the default one,
thus explaining to developer it's not needed to set it.

Pierrick Bouvier (2):
  tests/tcg/riscv64/system: remove exe_name as it's already the default
    one
  tests/tcg: detect redundant exe_name/test_name

 tests/tcg/meson.build                | 8 ++++++++
 tests/tcg/riscv64/system/meson.build | 1 -
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.47.3


