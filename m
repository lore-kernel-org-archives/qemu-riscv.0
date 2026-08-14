Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F4C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 03:18:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuiQM-0002kI-Hf; Thu, 13 Aug 2026 23:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuiQJ-0002k1-Du
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 23:17:35 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuiQI-0001N2-01
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 23:17:35 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-80cebd41372so8402617b3.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 20:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786677452; cv=none;
 d=google.com; s=arc-20260327;
 b=XtyLkIYD7gtoj1bQAaw6k4tyqwsp3USzJ7OXJPpWk4V5UfNtG8amja2o2R3A+npFCu
 sSWUGWH3cgJUHiFao8FpUY05zLv3kO+ZX/43zrmRWw4593ZcZ2JmXaiueSfQCV6L9h4+
 q4WTPvvw/14/U6coGBX9/4gbmM+WXlpRJM8b5sIVuRH7hMc/sYeLgqbG0FvmlaIleQp/
 ReE69dP6wW2Rr8AgCPzTAsVsick+c1nyWU+tGsPS/Opsf/IN3DnLWAJpM6b9FYjtQJcL
 pUK0ZDyNNPdx1jPZZv/Gi5rl9G/apBJjTJijNDOTSW7fsU9Ggaxgy+oO36plM6HzHQdQ
 nF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LAo5Gy+mb3KfoeHG45swKeR0Q2XMDagQYa4jkeN61nQ=;
 fh=haLNj98yzJ7MW0dFw28W2yq7EziWkSgrkndTeabeQDg=;
 b=sSZ/mG/d8WqdzDPONZOC/furjuf4qhkdKlhEuYPlWaiLJ+8LWBKiZcIGWPyq1flH9k
 LEWvJ9cyGF4zCFCXBaiDAzmcqV/5JqHzkE3e5/LQYQrYs+9Cs1Nl+CPr3Nm3xKT7I/tZ
 /cba1izO5Yu4f/mXby1BUEHbDT712IufvND50GUc02y1Qy8Vud77IgJ7tKC699n8toxg
 dpo8pNf4aREAqG+JI+6mAwR9kvNzfzFOy535gt825XjVWKyuLyx4neVY/9qykKtC4TUI
 JcaQ2wTnxr5JhpxHsUbdQKMIhk6Gj6uVjl77zCsjP17EHMfj6uKKblA71HdUjaI8SjR0
 6vaA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786677452; x=1787282252; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LAo5Gy+mb3KfoeHG45swKeR0Q2XMDagQYa4jkeN61nQ=;
 b=F4+5oH+TlNghwTbsQUv6+w8j3deYtlorO+ZENv5AOeEHhloPy2ZuuAVf5ZiQmXsqBO
 P3W07quU9fmNOtjLGNam/06FJ4QuCrE6kDPmU/DmGvOwR9al7An/ztuxGvVCcxKzm0MC
 Y+bh/pKSzn2Z5b476aFxK8UiauulfftSKrzanF4bNe7CznTRz6Q7e1vekUyXpC+gobfg
 5rRdnLP8Mgdgi65nlDRciohSJSho8sj5c2igDNNqvCXER1xJ1plfBcKl2miQUEcE7M1p
 OLjEmRN923jG7jihYBKcs4u+D3ocrh0xv1szvbXFiw2tCLQfxLeFBem/rNJ4vPKv+pEi
 7b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786677452; x=1787282252;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LAo5Gy+mb3KfoeHG45swKeR0Q2XMDagQYa4jkeN61nQ=;
 b=Ok4pi4/HfT1BBFtHPHph3AReMPjToBj5c0JFrYv/vXBQ2QWlh5+rEHZfS2Euw8w2YY
 mgGd+UMSOSYsR1jJigfsk/r5UQBh0LLuhatw/J0AunvwxNdZjGejKmAV0H1jpXLFIKTQ
 aTj7ZxDZt0tGA89O4LMuhME99ZVM0M6epwlnTzLjIPGiUU9fPucU9CrMXbH1B/sS3bMG
 xbIUSPuq1g8dLwEyNRlOvf7g+207DcLeWqB5FQ/6R7+JZiu0gKwM+lYI1FJtTlolr+tY
 qrCGrJ92EM9IZTL0XxTehGfGgm5CV21yT3GF6nL2zhnDNFCXBbyt182ekP6/sv7/Cf+5
 5U5w==
X-Gm-Message-State: AOJu0YwTORB3Waiw6ZXfrhs5szW2q2FLtPSQB/zguHUAZ66tdXXkM6C7
 qtCAwaJXyCl6RJYejbEg/VD6QOXhhLnS7iivyU2a4d2VVp1B+hWeMLQmLO/9qQW4PCMlhEiXMSQ
 nla7aFD5TvU41vJrRObgTQNKeuY6UNA0=
X-Gm-Gg: AR+sD10W9pbFxfKzEhIj/Vn+Gaj/TkMFJanq1Gx7HuuVv1V/m+UjN6dFLmzNIPMmjnC
 hZwmoGIzJZb/2szkqzCA1Q2iqsjgX4LOOdPHkc6K8FwuZEwOFbh/YyeK09runV/GZ7ewvi0xJoC
 o03SpKGCOrI9RRSxo3leR/6MG5IgI0ny5m3ebC0qrwX67gomaF75FziL2Z7KzWcmu+SOoHEdRi5
 zAHBDjWYo9rGeFOO6vjbShXSYuMrCzKWRBElqulQ08Ly7VTcB+tsyRum/bHgXebmckbUMEpyha4
 TXHG9Ix3tphG6OSKSEHW2RC7NHAXFBUC7rw/0P3pLrXCbg==
X-Received: by 2002:a05:690c:c3a8:b0:81f:49e1:1f03 with SMTP id
 00721157ae682-83712ac29femr12092307b3.31.1786677452302; Thu, 13 Aug 2026
 20:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260813135717.2758-1-flamboyant.h.01@gmail.com>
 <20260813135717.2758-2-flamboyant.h.01@gmail.com>
In-Reply-To: <20260813135717.2758-2-flamboyant.h.01@gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 14 Aug 2026 11:17:20 +0800
X-Gm-Features: AUfX_my9ql4fyazm6jdEDPv4jN8X_4o_k1bPa5PeyDwWtGM6LR9FpZjDyvzSI0I
Message-ID: <CAAW0U4ZRqfcNmWi8davsvu-zVFmq4fJgbjjESb+_As3vPnu7jQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc/k230_iomux: add Kendryte K230 IOMUX model
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Junze Cao <caojunze424@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi all
Kangjie Huang <flamboyant.h.01@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=881=
3=E6=97=A5=E5=91=A8=E5=9B=9B 21:58=E5=86=99=E9=81=93=EF=BC=9A
>
> Add a SysBus model for the 64 K230 Function IO configuration
> registers documented by the K230 Technical Reference Manual.
......
> Suggested-by: Alistair Francis <Alistair.Francis@wdc.com>
> Suggested-by: Chao Liu <chao.liu@processmission.com>
> Suggested-by: Junze Cao <caojunze424@gmail.com>
> Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
  Hi all,
  Just to clarify, I added the Suggested-by tags for Alistair Francis and
  Junze Cao in this patch just based on their concrete suggestions during t=
he
  public review. Neither tag was explicitly provided by them. Sorry
  for any confusion this may have caused.

  Thank you again for your suggestions.

  Best regards,
  Kangjie

