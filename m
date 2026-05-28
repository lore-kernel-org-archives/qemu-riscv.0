Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98395CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 13:13:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSaXE-0004zV-M5; Thu, 28 May 2026 09:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSaXA-0004y9-T2
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 09:12:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSaX8-0005kr-UH
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 09:12:24 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64S8vmIB298300
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 13:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=2VD1tzwDa7yMXVs8tT4zzHBWZk5uSTM6cVW
 eQ2acPxs=; b=nwqlmNDGD3EMoSdiQk5kEfocj0mRVV8YiXWQVRN3xuYutbkEaGA
 mDdlm7ElINHRpIL9YoQVTuP8ENK0YWfxcqkPpSSspq7X0kcHFa3jAKusdVXRCPju
 5Izwx4SqAHIUrAm56MK0UhR59NoUZOXvefYf8LqsscqBw70Rbdx6Oph4d6fkPzfG
 P69xGWZ9qVJFtG554sdDhqwaaflC24KY1GkdMafKJqyAz0fQXknOsILlIQ74tB2Z
 tM/5uO2/9pOvHJLbDibkT13nrwj3gaEpIwa7nkBI7hOrBM1Ud0EZkQjADADqoeMM
 T0rh4jFA7rEqwlZ3gBvv39sVRjb+mxdPgHg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajtjn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 13:12:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ccd51bc2f5so13586206d6.2
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779973939; x=1780578739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2VD1tzwDa7yMXVs8tT4zzHBWZk5uSTM6cVWeQ2acPxs=;
 b=LopTXMIguZgkJeTonAoTn/HIS3Qa0UOkwL7/O/Busdh4UTMa54HUd4gYlwrfwQSWV3
 Tpxd9K7Vpm9sSC6F8yhVKw/aQ8CCU/mYE4dJISY4CQQXI/rHQT/OSWM/ARrd16W6tQlH
 Gu38s3CJ4K9zzZeV4er9g3p/pmYCESwtxgxiHcUjpYqHM4r619LbG1ZciyMxGOQSptBT
 88IlP2H8RND8THQNsUUp2lHFDYCkfCS1mGvGd1GrcYBOEiNk4K42tcwfK/KWQH3Ux9Am
 s1E4uUlGNwjHQXlM75wsDD4msn8Ge7na0NUkCXR3rvYlEeabNB5982b0R6QWkkx4Yd+2
 SNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779973939; x=1780578739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VD1tzwDa7yMXVs8tT4zzHBWZk5uSTM6cVWeQ2acPxs=;
 b=CMtAEttVd70KuaOhK4dNx3xY7r+UGlWCWN0oqb2aiM7qfQjUKkrNBXGEGgm/xSffkI
 8mWiUCXgbxnvNMVYEJ8J/5SVklIp6ywVzLiXNPVK7f0DX/LCYerX/xNaLod8gRVa5+k5
 EyxcrZcSGRx5p6HWoGlbyU1o9snypJ86yvlMjcCS12WHydivjXrvYwm9QDeXT+YAo9vU
 4LPVGs7uwy0xtVFU43+yGSolY8ducg4P/3b8u0IfSOx34Yfsw7dYX5sZPO/szgDXAXv8
 bg8esn0v5H4ZcyOajrhs+tDFeHq/nnAph0dhBIbys4u6i07zWSLUOBqj9FqjpMdTrcEX
 WqSQ==
X-Gm-Message-State: AOJu0YzCNqFWcCiLBVXSXU03fZYyhfJoTnXRu43/CoXy86zk1CCULrDQ
 OUGBYsX3cd61Y0MWCfZ4hpBmaNiNxAvEIrHA83euVrFFPHFtRZNSF0ISmgGQKauapwL6D7X1bf8
 AxZhsnvbHRTmFVAugmn+m+DTOMrPDClS7RtubVRCba6tVTARVnwj7d4mPiA==
X-Gm-Gg: Acq92OFP1cZo7tIOavlm0GEyCzF/A4mSVTfQWmOy7KNFYS/vyIGp62sH7Y9FFKNkYR7
 207c9Z3Wr6F3FtvyRJENtmTNOAICAQAI1QdnG2lUATZj4LYOy8SMQahG/tMVoXgQsTbXg67bpCY
 5UUMJNbafFkkT22nsgtQOm7tbYzFdKbmibY4jh+3AUhDTqxKSS0U1ETCbL1eVogpT7cKnhudm9N
 yvR6RZ7VCfwBFbRt0rcd+KCf5hGYbYLBlQ9YU1AcxnycRb3rvMsU5B/LqIbygN1QaA1exbVK1A4
 I2f39+41lqYfMg1IrOL8HPIqbzHtA+J5rTNR+8tDTsW+sb0I9VKaDN508OpUU/0P12ZbifRcdjt
 JeKDh/a8oY0knchtdwsaLfWEuEb5uvgvcIKs+MSQrq9u3EAvuhw4qJBf7AfL/MXv+53fLS8k=
X-Received: by 2002:a05:6214:2c0a:b0:8cc:c85:8aab with SMTP id
 6a1803df08f44-8cc7b61c1b2mr436561996d6.15.1779973938835; 
 Thu, 28 May 2026 06:12:18 -0700 (PDT)
X-Received: by 2002:a05:6214:2c0a:b0:8cc:c85:8aab with SMTP id
 6a1803df08f44-8cc7b61c1b2mr436561466d6.15.1779973938449; 
 Thu, 28 May 2026 06:12:18 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.193.103])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cccf5428f0sm25000796d6.39.2026.05.28.06.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 06:12:18 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 0/1] target/riscv: deprecate 'debug' CPU property and Debug
 0.13
Date: Thu, 28 May 2026 10:12:13 -0300
Message-ID: <20260528131214.2251075-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pNyGeCsLYrwqhFkorjDtRipkuY_OK0Yj
X-Proofpoint-ORIG-GUID: pNyGeCsLYrwqhFkorjDtRipkuY_OK0Yj
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a183f34 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=e/1ukXmujkxnBaF7Br2KEw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bGfrn8OicFjwyuoRC2gA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNCBTYWx0ZWRfX2JduBS00ve80
 2NClsRtt57vnJUh6HaXV0PUKm3F/c/A58gfx8rcs/VQ4z5eKwC0wkMk4zHMIncPc/gM3mNM+TDa
 XY2khF1FhGs+WYy1kIVJQAvJhxZMG5wySipIK+aDg+BbyaN88Pg8LzS+DZG7gMpvE9fAGSNEPOT
 4d93adShe9NGfs83ddmUXrPNDBTJxJyQXeuyK1B7rhAkKfiq5PoWcykgu0OqcXaHMQS548WNQqG
 tkgWfijo0OhUwjt40vOK4TzWu6TA/66NZ38yUU8Jpm7dsGNk0+nk/LOeZPbCGjaB305KIMHGozn
 aB5UVGqIcoqyTkC0gTbMMfp7vLpbVBXLc8b5/tS/kfT6Mu+zXQ6EI5YynhoKh0LizyzpeIrq2Cp
 Cx2GENojwVuGvAhwqVosxS0e+OTF86JAnLQIWeGQzMMN95Vipo0TFudQkF0biNhleliVRZMy9hX
 JD4rCunTH8jCIR0bK3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280134
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

Hi,

In this new version I rephrased the commit message and the deprecated.rst docs
to make it clear that we're moving past Debug 0.13 and supporting Debug 1.0 only,
as suggested by Alistair in v2.

No other changes made.

Changes from v2:
- reworded commit msg and deprecated.rst to mention Debug 0.13
  deprecation.
- v2 link: https://lore.kernel.org/qemu-devel/20260527181822.1945644-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (1):
  target/riscv: deprecate 'debug' CPU property and Debug 0.13

 docs/about/deprecated.rst         | 19 ++++++++++++
 target/riscv/cpu.c                | 50 ++++++++++++++++++++++++++++---
 target/riscv/cpu_cfg_fields.h.inc |  2 +-
 target/riscv/csr.c                |  2 +-
 target/riscv/machine.c            | 24 +++++++--------
 target/riscv/tcg/tcg-cpu.c        |  2 +-
 6 files changed, 80 insertions(+), 19 deletions(-)

-- 
2.43.0


