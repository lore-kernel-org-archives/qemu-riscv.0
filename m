Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8D8CD98E2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 13:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZq8z-0006FT-0G; Wed, 17 Jun 2026 09:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq8u-0006EI-1t
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq8s-0002xu-AX
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:19 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8Vekq2191096
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mQFQuI+eGOOAZeYxPs5sfz
 TzENXfoT2/OlWwxDIL/G4=; b=c2BbnsOPQfffTV9DMkeHX/tB2dHGRJzINKKH6d
 Omx/ZpTCm5UMaDoQa+NHcOpBnE0NQwjUJTVL6fJQa/s89doCN4t+9N+Ifv2zhRiE
 PBwS6On2AfnCS1vED7wYEPYAGx6MDnVPZaM43x/gNz1UOygg8G+qGIFdfBpzaBvG
 +AR8RnwIYZILPcJv66vtdxtISdFlsoTSxSnnUJjIfVMkHCDm/bXEEllTXD8Lhi7S
 Ej7sDoWixr6GlXAI5QJVHcAnfQB3lxjQwOCGjahQO2traZVjf30J48/alqVaScI1
 32CbC94QOAfeZmdPxk3q1WH0nyG5O7Mf8vmrtX/n4Ej0k6Og==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeskah6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:16 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7f11b0dd576so89720177b3.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781702236; x=1782307036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mQFQuI+eGOOAZeYxPs5sfzTzENXfoT2/OlWwxDIL/G4=;
 b=WDpwC5gn/2PzLsW7ifEXptIahgmMNvQkHmlxQ8V0ZtU4oLXvgYZaPQqBqEPNLF6C9o
 BWJOtW/hTuQsVcG/93gfs+nqmPXRLb3OKNXnLp7JqBxghaqHtdOYMnzr+uzf0dmgDdJQ
 DXXVwLbJtm27XUsGaCXaX8LzDz6ar42um0FU6qtpusRuLOAzk6dcJbG3RIntnLQhy0RZ
 dJ6XyhXtH39rJt0j2otUxBRpMDm9J9o2v0cq96Zm4SGCHeYnE77op9pH3gENeMgQ9unE
 3sWkwbULSWf5lAGNGO7JFCW3UvUuQbBxvnE+6cwxajGMSldv4qB2FN1OvZgOBFJzIOJZ
 CAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781702236; x=1782307036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQFQuI+eGOOAZeYxPs5sfzTzENXfoT2/OlWwxDIL/G4=;
 b=HisNu1QeS4AIbqnEb6CCcmhKdZCf0q9CPZkMbCb11NZXsxGSWDZMnVPiy2asbZflky
 +ua3Ar1+YrB+uo4yOVfBANl3XbeKVNk3CLhcHLGTLOaY/f3PwL2+Z0k3svK6Rv0RbJb4
 jUehDNpLr1gibTpyJ9rWW/f62LkM4PUuLCZ9wVj0NSyG4mbyeJr+dNJVWBQ57WcMLLh/
 SGJXIpWw19jnZLRXUJIQJ4CIxj2vE3yzor43KfVjc+hgmQcBvSgY4u4u00YYHu39VMC+
 NnsvIupi8Sua9UX/pYCJJzEuf/MT5PLYb58oexGJ1HUWBQSXd9XDNbuGJ88L01mR2y3C
 QqTA==
X-Gm-Message-State: AOJu0YxpoQB2FcanSSRwrxI/ZWQnsc9PDfL0U4YGp1DbGNk6rJNTd3Bq
 zQ7yHqtOk6XBJZ+63L+ydPwmngCxlt3YMjHHH7dN+vJsNGJqGXf3tiyjQE29AMTViandWA5K0bv
 +irgsDzSz2gxXJZR1DoYQ8sWJjr1Ot/FtLDWaIYnUbzO1CsYkYi4JJr/C7g==
X-Gm-Gg: AfdE7cmuuu429hU5wg4WejRtmoHJ0tkA/xoPRwlrxrPrZ7PtA4XRd9yTi5EgfeRUX4E
 ghmGl1JC0R+qBBbhd9m6RhkzeAd/9yBYsZG3JLCuqoTLePerBMh20UVgmP0lrGJUVY9uRcthrNa
 9seM58ACCBv7xUB2NMPK2f1sUcTfuM/F3ac5zt7mG3L9NSdcsQChh2Y62Tj0X9UmCd7vxMYC7PP
 +p0HIiXCsbknXet53OY7QAnAiJIb77UZW7FstY6HMQrbuUClESQvX9mj6fX34twpUqD3bhJN8st
 ZaPY9/b3lGBb6sTVeAjgX8AuE0zNosjVE4bNcrhhPjvMYqWmO8HO59f9zYmLMZEvW6JoGUCfRzb
 WkMpfWeItyUo7hgLd6PKFzthg8SMzGLERFNVPfssMWnfTgZlB
X-Received: by 2002:a05:690c:67c5:b0:7d1:cd93:c8e9 with SMTP id
 00721157ae682-7fe5ba08fe4mr37073977b3.13.1781702235652; 
 Wed, 17 Jun 2026 06:17:15 -0700 (PDT)
X-Received: by 2002:a05:690c:67c5:b0:7d1:cd93:c8e9 with SMTP id
 00721157ae682-7fe5ba08fe4mr37073237b3.13.1781702235119; 
 Wed, 17 Jun 2026 06:17:15 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7fcd345a5fesm44861707b3.36.2026.06.17.06.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 06:17:14 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v4 0/3] target/riscv: parametrize debug trigger number
Date: Wed, 17 Jun 2026 10:17:07 -0300
Message-ID: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfX9zO92xLtWrQy
 hOJAPUc3+jcOgZiuDo0Jcs1oZUq1URTaTZw3KZv9xqRDw4Yhsyfmfe3yPumY6Ge12fkhBDy1aYp
 V+qVKcO4UL/B4mw0bI4Q5RrXvnobTbwh1QOBOlsXtJSFYqlFRu6MdDkgHLFMrnKNK8rG9adqq8W
 IV1F2lA2/x5PYSfA0alEf/WNT1awLpa/2wKiwiJCg/UH4azRdP2OU8o8zdqjdt9o7KrVjhrtGoA
 pW3CEpPw9XTncEkO33/9m4B1w7WMJ9uCfTPFubL5j5ufYfwIJRwu/BJRq2YC8S0P4TUIXRljxEx
 ZzwCSHaIwmE74lgrTqcz6F6zZZS/80+sVJa6RZO3QL2nbbP5Dhv1qJFP7oH2GnTdWPMCfIl+lmZ
 mI05oEEpfAW9dlUs6Pw3U2rNdQv4f3EsMDOR0bv2DtBwGvudpjWwgnJsbmQTmhzjudD8zVHSR+b
 B0vctTRUwYD/h1iqKjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfX4jmhcC26ywRi
 rG/R6m94FCcoGCuzqcog84zVRNIDIn4JJ8uNWuN9+E1Bfd1u3jPQGvEFMMImE3vb/py4k38s9o+
 HPRiDyqggS0QTMM1vXbC2texrAqpqLM=
X-Proofpoint-ORIG-GUID: 0qZw_I0xIlJ1o-4P4mE4dDaMEELJzdCg
X-Proofpoint-GUID: 0qZw_I0xIlJ1o-4P4mE4dDaMEELJzdCg
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a329e5c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p9zSoqrg4HE97OURqAYA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170126
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

This is a re-send after rebase with current master after the recent
RISC-V PR got merged.  No other changes made.

Changes from v4:
- rebased to 'master'
- v3 link: https://lore.kernel.org/qemu-devel/20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (3):
  target/riscv/cpu: add CPU unrealize callback
  target/riscv: dynamic alloc of debug trigger arrays
  target/riscv: add 'num-triggers' debug property

 target/riscv/cpu.c     | 26 ++++++++++++++++++++++++
 target/riscv/cpu.h     | 39 ++++++++++++++++++++++++++++-------
 target/riscv/csr.c     |  2 +-
 target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
 target/riscv/debug.h   |  1 +
 target/riscv/machine.c | 16 ++++++++++-----
 6 files changed, 109 insertions(+), 21 deletions(-)

-- 
2.43.0


