Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64A606A31D
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U1vAWmIV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCKsgtSS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ4l6-00046y-6I; Tue, 20 Oct 2026 03:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJ4l3-00046A-Bs
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 03:59:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJ4l1-00077D-JO
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 03:59:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K0tBJT2877684
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 07:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WkU9iZ1+0WVzIYKoUqkhbV
 u9mIoQ+LL0V0jE+7MKOfE=; b=U1vAWmIVo9tXy2oE/LZJDlopErBbrO91LY+BCI
 vHcAAQVpn3S3qCdmqoeDOs/g6bnv9pLBQONHHCvZM4xRVcMTRQXniuV4FQ+JV8Ad
 hSRucej4RmuQppVXweAji1zVgs8F7u6AkTKA3X9WxKkzqjeZl4wlN87zk/jfmnqo
 BxVEoqqmuNZiXPlbnC+T5uW+le5baqO7bu/aC6opOVmkSEdQuKF59Ab4vQCpV14K
 YLrskheBrw7aR3V/birn5zvSNxw8M/SrsctW7Q1SebMcRL2nCs+uyhQeUaOB8r4i
 H5d8P8gvnOwm4P130VBirbdfK6wZIkPL8Y0RK0uw8eivKp6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psgpg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 07:59:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91becce058aso62324526d6.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792483170; x=1793087970; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WkU9iZ1+0WVzIYKoUqkhbVu9mIoQ+LL0V0jE+7MKOfE=;
 b=hCKsgtSS3/fTj8yo/DeaLPXg/6KyiYJu8J0fVMkyYVdmG8w1J8/W6gSkwKbahGPzW6
 h5HvINOegZyKfjP9lgh1NZG7RzXHfxgPOISXxx9zAsCwwX0IdZaMoMwdAj2+q3I6InuT
 Dp1KeAtMF1X5frDd+4gfqdZ4lLy2B0If7X9YOXpf6kLk+Z+iRzDMjA+8uJBRH5voZ2gi
 KXlVNLtIxqh+0e3lSAMeX7phPoNz+HmgbzxdopWf/FrSMtLilmvXIKYXNrsYcUdUsVd7
 hb/v4aOeTHHMLhhKA1aV2v9AkL6Gc/g3dNFSWXggQI6kp9A/spSOWO4EV4o3HGNKHyAx
 NLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483170; x=1793087970;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WkU9iZ1+0WVzIYKoUqkhbVu9mIoQ+LL0V0jE+7MKOfE=;
 b=j/umzkgIWzCy/2WqRNGSMDce9J8AdluXoCG84DzJRcXRyvEZ2/qX55/Re59G0yp5Wz
 Hjw4WVvRD40yXjGs7OkSESK1UZmDnFsM72Uf9/scWmirDrwSxsSCIK1f9J7kC/KOY0DY
 JI/UHdy3lHV6InI/Ztyi+2Szl874BJzXIyd4Ve7ODxkwXbyn968pFQqU3bTCE/K9cdYR
 ca324RuVDKh0jDEVCPOcyuTrXqdrdWvgZQsQ5iD6Tx0usZDmukDV1f4XUJxIY57CPNgQ
 yHubDBs6fARI1+KzYo0GdUaBPffn/pPQV0kzEYtVG05A29wXtBzVQ5LN3VnaFtsOZDSY
 V5gQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8SHLYM5piHN4H+o8uXL27TvY97EPH8xY83TpCQdoV9aRbwGepWM6aGw0v8oznCHKcprspbJELYtPu@nongnu.org
X-Gm-Message-State: AFq9FYLp8nIs0TUp8o7STQUQPpplwjwENW5YHmAxfsCZw9epwd9odTUd
 4R92DT4JFn8dgMVZTCi36iwClszZ7rnP0UKFXzn+iPIuXnJ85dTGWvXmOpyYz667b+AKZH6TLYK
 P9nHQmV2xa44pUHYazjOarVEf97sKKEmPEmLdel2DdD1WnXUNV/AXWrY2mw==
X-Gm-Gg: AYBFou1gxpjf5KRzrcRBrL6R+244TuitmHjCbnMR1SkU1NVq+fcp/7TroMeGTjzo+WV
 fgohQsRi6NRxo5NahZyWh8hxihLHXpSNEYzN/oyA7rHh949CoqapvnHCaZwUVLQ6FpeYAl16am5
 Hkz8hhxfyU4dDkD0yfPAo8udSy7ZK5k0y+UHN1Y2RZnkPdjHODnqLk9UpP4UycuKk/gHvXk+VSu
 WdqGK7NH4GaU5AfhxNOOJkGyItupbfKGO2qEKRnHeJuZRspeUmDFOn0esmHX2H5D6Y0OIldSqwd
 jCL+CxlGnyNtv3AQ4GBtPvXpqeOsdN5rHyp+EiK9Em+QPBotLO19Y4c2bEtK18dLA8SEd8dE2M2
 hPZ9ccyfda90Q9rfi9uzfDR8PDs1IkeFo5cVc/8fa
X-Received: by 2002:a05:620a:2588:b0:93e:5daa:67a4 with SMTP id
 af79cd13be357-93f29cc95b2mr1660362385a.29.1792483170447; 
 Tue, 20 Oct 2026 00:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2588:b0:93e:5daa:67a4 with SMTP id
 af79cd13be357-93f29cc95b2mr1660360885a.29.1792483169981; 
 Tue, 20 Oct 2026 00:59:29 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f3833f93sm28131235e9.3.2026.10.20.00.59.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 00:59:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] docs: Move RISC-V 'Z' CPU properties section to removed
 features
Date: Tue, 20 Oct 2026 09:59:27 +0200
Message-ID: <20261020075927.56983-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad71f63 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=zR6fKHwmc8os2Q75lMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX8/7leLREEMI3
 e36vpxNd1LfPryxWXVFyR7LeE2F1u/nCj2cpg8qsNcpG+EvKwRAf/WueFCCQA375SamuoBMLJbC
 jjtP0Xvl1nsnAHaHp8s4ZgQ4DqU3wPZOf6cAiH5M+1o4xJxuPJWL5hcUzyCuUHnsiXAIRTYxVtY
 49f7A+HFVy7yoBSLS45y4jlWP0aQY90VO4PwQfBVG8RtIq2vG/oAhDPrjd29hBTvvpRH32X9Bj5
 yP+DTeD9MxHpu/M8Q4j50LWYQkzpIqAORJBWiK2GSUHaHbqg9JocUUL42qIVOfnDY6p6EqJDQ3l
 NGRVnmOQwsCECAiBW/v5c2pVySqEr3+/EUHCiX5kLvvZh9Kv0ZMKWdcepWNeFa8HxvXt8gJ4v/6
 zqr1E5bWQGpelzJFL+tquFA+57Pl/1L6HyJ9dXERx4pgISFqwlv/R7Ku0r9A/IYN38D89zqeK0j
 GAehx4dx8GAwiDxQTFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX8V1I0V0WwYXx
 74PqAHCvFO3V4pAYx/69qM9pvg8tjwlXC8VIjBOuXQqOyZ1fVNrw02YbDqY55BINLI8mEvMl/DY
 akp5kk+aPw2vy6xMJMiCwPccA1og260=
X-Proofpoint-GUID: 7TcOEp4QNh18DbyYaO9eE0cOo74Btt1s
X-Proofpoint-ORIG-GUID: 7TcOEp4QNh18DbyYaO9eE0cOo74Btt1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031
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

RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
for the release v10.1.0. Move the corresponding section from
deprecated.rst to removed-features.rst, adjusting the wording
accordingly.

Fixes: 455c0fa9eef ("target/riscv: remove capital 'Z' CPU properties")
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 docs/about/deprecated.rst       | 24 ------------------------
 docs/about/removed-features.rst |  7 +++++++
 2 files changed, 7 insertions(+), 24 deletions(-)

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
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 6a9944a0c79..225841bd9bb 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1038,6 +1038,13 @@ initial RISC-V QEMU port. Its usage was always been unclear: users don't know
 what to expect from a CPU called 'any', and in fact the CPU does not do anything
 special that isn't already done by the default CPUs rv32/rv64.
 
+RISC-V CPU properties which start with capital 'Z' (removed in 10.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+All RISC-V CPU properties which start with capital 'Z' have been removed.
+They were wrongly added with capital 'Z' in the past. CPU properties
+with lower-case names are used instead.
+
 Power8E and Power8NVL CPUs (removed in 11.1)
 ''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.55.0


