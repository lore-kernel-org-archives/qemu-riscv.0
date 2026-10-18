Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB10CCA490
	for <qemu-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 23:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIZyp-0001xb-Op; Sun, 18 Oct 2026 19:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIZyo-0001xL-In
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 19:07:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIZym-0008FJ-Ng
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 19:07:50 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69ILj7tp883087
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 23:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Vw7XXvh93hkTueCsFYlkxV
 0beTx7+p2NZ+HttDarvO4=; b=V4+J2JXrTS8KElf0e5znH8akC7C7MwnCPKZGPf
 3aRMzvkgpS9cRlnhGQo3UkhoVym4y21Ew+LcJjmDUrB6prgj7Gu4TfgXDPrX4oZm
 5qd8hPGD0A/maooWTB4AFby1YT58cy66TtIGlUyC6g+AXFqRBSSj1AhDUhP6d8YP
 W00DrLUSf0EQqa7WZNmc8IPIG0gPvoWC2a291VKlZ9X49c4Gu9bqHrr0vKVC7r+1
 kGxavO7mo6v/gllF14fmlb9YBM+jt/8M2fekRIpe3+YESctjV8AKN3jqPSdyqzTd
 R/CGdMuex8qATpvRbcMx+rTsQMZRh3ZoTQonIvzOOFUpcFaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183c330-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 23:07:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93a082c014aso390849285a.0
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 16:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792364865; x=1792969665; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Vw7XXvh93hkTueCsFYlkxV0beTx7+p2NZ+HttDarvO4=;
 b=Dl5aEq7xtUpIdVPnx5g7iBC4PL05QuytQSNiKDhVIOlLWuF3kmCH4I0kmegZsnEdGT
 JBpWPnNI+Wes1I6iqwcpJd75dBKtgQC1IWcrQZgVOg2NNgSKFCtlKj/HrPzow8BDMFS/
 T5nHVO7A/H4+1Wvc00k00hRrYNaqUAdlvk9BBovM87VU00JgdZNNma1PXF0HTKeR5VUY
 z/Q8nYM//4ATOAY+6Tu+zIIpztuyMDGSFBn2D2i0qGz7NVjJ00kYqvCKF54yTJGziX5g
 ZMmoXn0+JzlSob8AF+eTAdnm44WTwHfWIWZOiWENzgRZICyF8mpHOM/he+l4uAoWxL2h
 uGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792364865; x=1792969665;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Vw7XXvh93hkTueCsFYlkxV0beTx7+p2NZ+HttDarvO4=;
 b=dfV+2LfQNUT97cE7PRudP67dukuTkttlZsZR3bm7Qj8DjbXphTFXq5u+f6V3unaKB1
 futeXTQXyxiQflMbYLABb2S2a1l3Xfod06g+CGhYGqPvQPe2z83V/kAzIHGD9ml/Vzp4
 VjhWBo59oRvLCbg/NBvCm81deCSoQwBEEkyE5nXN7sJCl/D0OdsFzInYpXuVT4omj2gI
 /Parw5bSzIeAj8g7nFTAYKYoHKSXNBhBxA+pxFJxrSe3tkOzYyhNCy9xl3YAgp724K7x
 VBaJdnximpkAJcwFTMDTQqgWa97jlOfk66nWBOnGk2fl+LI5dcHzr4MwXd69GUtqgF5I
 2w6A==
X-Gm-Message-State: AFq9FYK1eAKii9CYaoNpVofkMLFU58LjjQrFQevrxLoECYJYF09UGGS9
 pFa4smcpaBTBNIgGapnhxGgqEucjaflZ+VUn+/fDZ6T3qvnzIwt/zNP9lcfUJ5/PK2uiIbil/ll
 aNqXobU9lz2gvcbt3a6oE5iPTBgltHYDwdSm82JbMRZ5saCTQ4jsnDsvPRPHrhxLBDQ==
X-Gm-Gg: AYBFou1pG6vHF/Ew8mQksGr5OBsIny99tBxSAgnWGJtvqE8e2R+/MUyWmE03xggJqur
 VPf8PIfMf1545YC1j/HBc23LhQV9s0JIgiI80YcVQEUZVJkwnBsQhu0bst7H7Fix1CapQSX/0ak
 ZP9of1aDq+7wSPrsSHQv9y2HNx6LcjnMXSVLoeJyspqBx2FuybacXstCfVWDMXe99P2BT6t6Xj8
 9HRwJ4EYLYpPY9RWkxefgc4+oZMbVbDgmMs0zVx2YNotl8AAo5iI45O9n6uDsiNzHY1qFiIAu55
 ZT33VXKxB2UhiaCScln6DWg8QHnSXmdX5AqLgltZtqCiXpe89A3YZX/thhi2bG80panDJa2oBlI
 QdCUYP9wPwlITq2VVhOMm9SRYqb2OhTHevA3rFlmG
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id
 af79cd13be357-93f17f9f371mr1515256485a.37.1792364865413; 
 Sun, 18 Oct 2026 16:07:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id
 af79cd13be357-93f17f9f371mr1515252785a.37.1792364864888; 
 Sun, 18 Oct 2026 16:07:44 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm19230164f8f.29.2026.10.18.16.07.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 16:07:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH] docs: Remove stale chapter on RISC-V 'Z' CPU properties
Date: Mon, 19 Oct 2026 01:07:41 +0200
Message-ID: <20261018230741.6560-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5MiBTYWx0ZWRfX+YsQRAgwgaFT
 P132PQ9MAaK7nSekrtxQFyrn3xhhPB7EOkEDHQHL6TMrE3pF7r5D3hMzvTKaqTS0L1HFtBnrlAL
 pCkIvlPAp90uSBZiopBI8S5LnYvnBKs=
X-Proofpoint-GUID: uppGE6S80RVQQuDekwyuLB9cnX7pf4HQ
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad55142 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-qirTN_0YUXb2Kf5Y8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5MiBTYWx0ZWRfX3YzT12xQ1bsS
 69Foy26EQevyhsGflTmGuWxSih+uW8cmrIsiFkarYlM4UoRDvFzmt3Egrgbxo2NrSbQfwwlGGku
 +z9ZsX4iLolqq7GWegVe+DX+18Mq+MaZ+4K6dizNWTHGcvPoktJT0uyk41ZwG0/eNe+glzNDj2F
 Qk9BDSFyWlLOKjawS5BC9HY+13xb+7p8o/QDEW9d134AEFjKeJk03fyauVmg5/o5kHvvgIgaVEr
 rhNMjQsw7nfdshd0TWvTXB17FccbmiufTcFnZj5LVdP9lhaob0CNqzTneefJbrZO2UiNaoomJBx
 0+aNsBoHFytyHDUvk6VHFCMIc0ievCPcSvM5iCz3E/47IOQLHYyfs613iZAEhdJ6YNyOmDZvhzf
 +CP1ekA4nhAkTl9xQjBmo1spZDgsYAQ1AtqrV/UDhsxni2Vubb2SlUzGGUWdEHjTrLFuyPA5urH
 xW0Z9vnshOkAknM/dKQ==
X-Proofpoint-ORIG-GUID: uppGE6S80RVQQuDekwyuLB9cnX7pf4HQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180092
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
for the release v10.1.0. Remove the stale comment.

Fixes: 455c0fa9eef ("target/riscv: remove capital 'Z' CPU properties")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 docs/about/deprecated.rst | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ccbc4219497..368fa1b4ed3 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -349,30 +349,6 @@ the addition of volatile memory support, it is now necessary to distinguish
 between persistent and volatile memory backends.  As such, memdev is deprecated
 in favor of persistent-memdev.
 
-
-RISC-V CPU properties which start with capital 'Z' (since 8.2)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-All RISC-V CPU properties which start with capital 'Z' are being deprecated
-starting in 8.2. The reason is that they were wrongly added with capital 'Z'
-in the past. CPU properties were later added with lower-case names, which
-is the format we want to use from now on.
-
-Users which try to use these deprecated properties will receive a warning
-recommending to switch to their stable counterparts:
-
-- "Zifencei" should be replaced with "zifencei"
-- "Zicsr" should be replaced with "zicsr"
-- "Zihintntl" should be replaced with "zihintntl"
-- "Zihintpause" should be replaced with "zihintpause"
-- "Zawrs" should be replaced with "zawrs"
-- "Zfa" should be replaced with "zfa"
-- "Zfh" should be replaced with "zfh"
-- "Zfhmin" should be replaced with "zfhmin"
-- "Zve32f" should be replaced with "zve32f"
-- "Zve64f" should be replaced with "zve64f"
-- "Zve64d" should be replaced with "zve64d"
-
 Block device options
 ''''''''''''''''''''
 
-- 
2.55.0


