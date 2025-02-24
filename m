Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B6AC021B2
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 02:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmOfA-0000kp-S3; Sun, 23 Feb 2025 21:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmOf2-0000is-HZ
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2025 21:57:36 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmOf0-000189-6F
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2025 21:57:35 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2212a930001so106394215ad.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Feb 2025 18:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740365852; x=1740970652; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hw2IJtY7IZ4KymZBDBvHYBuimc9dyqnwvi3DV/6wYZ4=;
 b=OsDgsHliNJVD0Fl0l6yIYFfrHSB2JK7EarJK+M+v1gWQBkPuS8sKLFIkNsSxhktmYg
 jCB00cmGRPGY7kgZ07l31WoiYTDXMrOyi/sD3PCyBtzSoPX2mIDBMyR4Ljmra1MJE/QU
 aul116oaKlMVtqNex9KmQ9UfUOmFTzz3VrnFvkLPAicG6B7hnesm3N4mythDkPwjsUvo
 MhdRw5HQW82N4U6KJqmUCKCQLm3PdjhoW9vJdMhfzm4KpJiT4MP1YkVYac0FMRtKE5sk
 kPvyUXTRJ5h+nN93VMbBf35UnB+14ZNjQ7PBhuOEXrIgF96VKn2TFb9n7EmWO/7D+va5
 fT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740365852; x=1740970652;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hw2IJtY7IZ4KymZBDBvHYBuimc9dyqnwvi3DV/6wYZ4=;
 b=B75LcSP5b6Vbk0WfL2Mivi2O1dr8KjJexFM38EPykbmCWPT2HtGbp42z4Hi+ynhq6H
 QURX9IPgzEb/vNOhoAq3B1YiprrA7SniwSLtz5cEoSH/ckFU9ShcrsWXql3GWyIVakiH
 JrHe2K/VHUvAyXu7hIecXa3UdCMkL2dqabF5i6zxkVLdoSpKWpv2pOPAYqo+5Wz/PmAv
 m5cVwZNC/UI3Uf+Fevy8mIYYfLGmw8E8Qacs9USuzmZdHA3FVMpUgVyN+QryiodHlBwd
 ZBMrBtss6EW+jtC5kdEdiXB7z+bH8VfaZX5SqKMrSTmt8w5o9PlPId5Z4GcpayEZ7gq4
 8jlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKz+c/cmYHSQckGQM/7JsZGKzBak4gJ9iT2T5ZL84s0+dknI4VAgh4Q0ss+5bMGzZRKo1GicPeDgU3@nongnu.org
X-Gm-Message-State: AOJu0YzhUblhbUsXVXPEXtH1txkpv/zLG3TiWWXhIUA+jb4wbuFZcyb8
 KdWKAb8/mpeLI70NSwtz1iLAX8q1jEuX0Ymdr9uraJInv4NDUpodEkWZ4QsqclI=
X-Gm-Gg: ASbGnctr4KbEAbI+4HSaocVSw96UFE4Y2q1pC6vzEaAcp/hwbbaK40HKQ96h5mBFTVI
 W/6l9Ozv9m3l+bBKuBHfOp31xaoNhSREHNzvNeT+5RQsNJJ7+903sNfvypfvEMjd1DVXmJpUY5Q
 BA5m3ILUtNl2e80gBUY0n6f/SOXXs5EcQKKpikYinFJcnaWHhXpA8/sancc80eolHyPnaAYamAL
 jNQDlTkHQa2+fHZVWlUTP1KMZ+E2MEkZ7Np5XEl7DYQpNuwBJR3YBGfSmHOX2xqlh9SZhwXqLJN
 4dvFAHgpUnie30IIhAiVfQ4z5qMeTHeCBPlGwyYRH+hymS/7YgpdT0ey
X-Google-Smtp-Source: AGHT+IEvfJYbVNWjl3OPsGEGsSGTWhPVIPMaxJfevR427D7l08PpIR/lq8B+Lpg9LT4zLWpSbTzS/A==
X-Received: by 2002:a17:902:e5c4:b0:220:d69d:78bd with SMTP id
 d9443c01a7336-221a1199349mr166506835ad.51.1740365851678; 
 Sun, 23 Feb 2025 18:57:31 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d53490c2sm171660665ad.47.2025.02.23.18.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 18:57:31 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 0/3] riscv: AIA: refinement for KVM acceleration
Date: Mon, 24 Feb 2025 10:57:17 +0800
Message-Id: <20250224025722.3999-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reorder the code to reduce the conditional checking and remove
unnecessary resource setting when using in-kernl AIA irqchip.

---
v2:
- remove the code reordering of the riscv-virt machine since it can't
  work with NUMA setting. (Daniel)

Yong-Xuan Wang (3):
  hw/intc/imsic: refine the IMSIC realize
  hw/intc/aplic: refine the APLIC realize
  hw/intc/aplic: refine kvm_msicfgaddr

 hw/intc/riscv_aplic.c | 73 +++++++++++++++++++++++--------------------
 hw/intc/riscv_imsic.c | 47 +++++++++++++++-------------
 2 files changed, 65 insertions(+), 55 deletions(-)

-- 
2.17.1


