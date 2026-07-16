Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5530FC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJf-0002g8-ME; Thu, 16 Jul 2026 08:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJd-0002f0-7u
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJb-00072l-Ag
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiLPQ2637037
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=+oAze4cUfSL3vuANzXriaZ70Ab+PghsQ5YC
 6/ca/oTs=; b=mr9pMzLL6ikigLU+r/eEWvF57f8BQTQCEy+afFGDq/tCy9OoBpA
 +bulDbCyy6/vjihZhFKO91CTw+SRTS2+K41uQy3r5YV0yAPM+2qYRE+cR3MwcafZ
 geUED9p/NMHB5PYE1H21Yj518QuiPedPGW/xo/WoeGwbMLw4GIaEVCNq6GQ2Jlkg
 hd/f4kxKugTjwkm7AobzaYAxLGoVCVEzxwVjjG6ebKQfPMhpJ/SUYFEo1NbLRgsC
 KJva0I1B4n9masiUyJF+fC2zMn44B2uMzksxQj9x0rOr+mVONIrQ4Z8Tuggx/lgI
 3QdAjNwUjR+9Hv0kPhrKuLN9QFiTV17rnYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex13b2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f45dde7595so38273906d6.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205343; x=1784810143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+oAze4cUfSL3vuANzXriaZ70Ab+PghsQ5YC6/ca/oTs=;
 b=Xddae1ZPpd8CmGkpX6CAhS4o+e86KOa+SqiFZ3tRnE19Va3D2Jp+Oa0iVmWjgaudAT
 YI6Rl2NE08aSCLSGck55jXcn9qYVJXJOGDAw0lJJNRSoLbIyANuqioGbLq44dFfm6m9/
 4jAKNtcKDO16sJbJWL1knrr4sCsdRu65WZSykKGgFXGflPGJriSDN8EUY+EYUVdq8LUS
 qEdK5JVSMWx3BBu79Dj9HOInOd09innNNNkTE1Jxd6+uovZkQb2AhVj+X5rq534pEzBd
 H0bySywJjet8HToJ/5mPe7D6US+RUy3HHULFgOKIlDtMP+Ch6LK0KsDf3oOdPn4jTMSE
 gjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205343; x=1784810143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+oAze4cUfSL3vuANzXriaZ70Ab+PghsQ5YC6/ca/oTs=;
 b=dFfWNVVtOowl05uFcptVF08+QwXEiM6B/hdcVtGJCLW+/PyUX5HMmxABDfRKBSrkpg
 KcQZyxzHvo73LQDXoIfHaNhP0tEr4nHNAHnxh6kENB0CCperP9e4aHDkI2W3Pyo/x3md
 AZTi3ONdk4kynx//5oYuybRUL3cKp0OmklF8u1M9pim6VHTyOMa1PhBbXL61R8MUHPpn
 kHEA3bVw2/yKbYOvRie4pEUg+DUJ5PVmk27zO3GHTob90Jul+rjt1Q34ElZ9y43pP39D
 GsnEv8KDCHRov1tLzC58bJZRIZZWP0Rf50/E95lyHHg7+4+rXXO90gnTKUKbTfiooMt4
 0Elw==
X-Gm-Message-State: AOJu0YyCfxd06l85BNxsWr2jFqS7vGvn/dhfJ1YADpQ4AHwRnG0eZwtK
 steIwEijUOYBNTOKI7BsXMH6Aun2dD+JLpYrBP33h4JSJP50ZqhJIqQcyZq41U79J/iGkCC6r4E
 w6V2LSZQm5sboEEd0edmCjj27e+9TsPocGUk8K1ep/buAgY8IDzpxzHlEnw==
X-Gm-Gg: AfdE7cnhGYLJyXREYY/0CLhVhwJw1HGLxcln0ddkb/wDrZNxA+Ac2Qli2w1prbHwf1M
 kp08y4cjml13Tfs6yPiQooUkWSDQ6PkVrP52Vf1COoarsxoysGFriZr35O8XCitdfhuO9kF3HJV
 XnA7cnoPh4LMOMNomDity6Fr7EKMJO+aBGvnB9NlGZjmdiqxx9ikzSpzOqYbxH+NniGkEOJGfSh
 VEPcrSJPE5Ul1vJnTzRUPFluY+ihwEizGJINZAzI4eAzh4i8fwHYHY2ZtMecBODm7Yrr4xlcdy5
 MyH0Qs/iQ1KRlJJk1FI022c2uoreMUizSrBQd6a+VrM3T60HhlJ7tLhKpBhumZVhg8Gjds8mu6d
 ORGwKA1i6wCcQYo+K73jBMGYU8S+0t6cHjI8=
X-Received: by 2002:a05:6214:5e12:b0:8e9:f62b:8fa0 with SMTP id
 6a1803df08f44-90401d69c74mr229565536d6.53.1784205342983; 
 Thu, 16 Jul 2026 05:35:42 -0700 (PDT)
X-Received: by 2002:a05:6214:5e12:b0:8e9:f62b:8fa0 with SMTP id
 6a1803df08f44-90401d69c74mr229564926d6.53.1784205342388; 
 Thu, 16 Jul 2026 05:35:42 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH for-11.1 00/17] target/riscv: Nick's debug fixes for 11.1
Date: Thu, 16 Jul 2026 09:35:17 -0300
Message-ID: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58d01f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Bu3byT1gSwfub-_dy3EA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: yrhyDgptUrc2FRK_giPnz-H4L1eDPiNU
X-Proofpoint-GUID: yrhyDgptUrc2FRK_giPnz-H4L1eDPiNU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1cUwdtFN8ozW
 dvUBW4ALIIzuBm0AZrwEpT/3Vlc2/TadoINTnWmRgMTGEfi29gOfEYMbzajMim9Obe0Cs79X91a
 dHnmzmM9pb/JJgeEvfAwB749K02CC4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6Ntv1bCaribE
 JxgX9vJnEdKBClR04NkSbFiXoKgYeF5T6JyKM4SDADWvKkEvCzac1BUZ9B4NaWxJJ3q34Bp+YRW
 rLVGGTjOQdEDmyAAfUJLsuZmICpTYQeWJ9SPb4P1F4HHGCE273ylv2zT8T1T1ib9Rgi3pwroleG
 zD/xf5lIa22MRrjxgM3HHj2u05pcjsHqqR0WQb9d/Lchmi+zNKlBDGTPqcxS2UkSNXpfLDUxSFG
 9qyqcUMwSgznb66OJWsCNbmJXf5HG3ZL8gU0vap0Rf2WgvLEUHLs+BqvRNW5sTCKcGRSKyMyzqT
 S7nQ2PjbKQUDsqSlfYGWQYGt7QGryKy/uiE4NwLuR49NAh17FoXfyBHyhv/THR8hIQtSdYro37h
 BgsY1EzK4Q5sVDuWUmFQEsbjyxvgFzMLJIvujtZNGPqOUHGESUWp7HcPVl6mYoPwcrgn4V7aCqs
 dG9NUoKbeB3XSSM7o8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Greetings,

Nick sent a RFC with several debug fixes and some new features back in
January:

https://lore.kernel.org/qemu-devel/20260114044701.1173347-1-npiggin@gmail.com/

I took all the bug fixes in that RFC, rebased and I'm now sending for
11.1 upstreaming.  All patches are fixing something that is currently
broken, with the adequate "Fixes" tag, so I'm comfortable in sending all
of them for 11.1.

Mister Chao, if you could take a quick look in these that would be
terrific (you have acked patches 1-4 already).  This is the first step
to finally upstream your sdext work.  Next step is to split debug 0.13
and 1.0 support, which I am going to do by maybe taking some of Nick's
work in that RFC, maybe with some new stuff, and then we'll add your
sdext on top of the 1.0 codebase.  This is all 11.2 business that,
hopefully, we'll get queued and ready to go as soon as the 11.2 window
opens.


All patches acked. Patches based on master.


Nicholas Piggin (17):
  target/riscv/debug: Check only mcontrol triggers for break/watchpoint
    matching
  target/riscv/debug: Handle changing trigger types
  target/riscv/debug: Implement permissive type unavailable trigger
  target/riscv/debug: Fix icount trigger privilege check
  target/riscv/debug: Update itrigger_enabled after changing privilege
  target/riscv/debug: Implement get_trigger_action for icount type
    trigger
  target/riscv/debug: Fix icount privilege matching icount_enabled()
    test
  target/riscv/debug: Implement icount trigger textra matching
  target/riscv/debug: Maintain itrigger_enabled in
    helper_itrigger_match()
  target/riscv/debug: Fix breakpoint matching action
  target/riscv/debug: Put mcontrol load/store match address into tval
  target/riscv/debug: Remove breakpoints on reset
  target/riscv/debug: Fix migration post_load icount_enabled() test
  target/riscv/debug: Insert breakpoints after migration
  target/riscv/debug: Advertise icount trigger type in tinfo
  target/riscv/debug: Reset trigger type to unavailable
  target/riscv/debug: Fix minor comment typos

 target/riscv/machine.c        |  13 +-
 target/riscv/tcg/cpu_helper.c |   7 +
 target/riscv/tcg/debug.c      | 326 ++++++++++++++++++++++------------
 target/riscv/tcg/debug.h      |   5 +-
 4 files changed, 229 insertions(+), 122 deletions(-)

-- 
2.43.0


