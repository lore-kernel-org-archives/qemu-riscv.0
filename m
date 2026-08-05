Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BEDC55174
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 15:37:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrdfs-0002Lc-Od; Wed, 05 Aug 2026 11:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wrdfr-0002LJ-Rw
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 11:36:55 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wrdfq-0000MY-Jb
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 11:36:55 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-667b0ced2d3so1794052d50.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 08:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785944213; cv=none;
 d=google.com; s=arc-20260327;
 b=h/0rWF612SaKpY+cE4LHUS6PG0ENKjtNGmMq1439Y1nYe3oq3BgK2bam2DqZGPQ2NH
 M6ybqyjskoRgdAn8egrKZO3FOTLygtbxuDmsUOTrEGmLagYmMc/q8qhWmtjYqbuZWIkq
 OfzZpkP4lqD8xI+VqO95YKEwbYBrMVvp0qKXNAxIp0Ac/EvuqCDvkAQh0XDq/wwXIqj/
 ioOmtLXazDp1fNyYqXqpDdSz7vM21iTAp0MsIfQCpNabBP0vcp8zzrWDNFQxz7L2byAx
 XTEQuKT2mPP713elpAopxHwscSE7wbBjhXEG+Jbmaw++4kEXsSKS76i/+iJwr3tmX6wt
 qjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dcVDqOBD+RYP8gAP5Yk2CFuORvHnd74U/mYR1CF/7zE=;
 fh=qRta7mziTHZUioYVKE3OLv0s9+IEETXDohxTwW8MYnc=;
 b=rsrCRVWEgLol4kRpiStChab8wY/R3EAofQUIWdFyBKKDy3d3GBgQzISP5a8526Pbxx
 e/hqD7TuOi9ku44qEIyrqta/FX8dOHnSaYVpEFjtaE40/Ob8K4mBcq5vXRkzivFTTVt1
 xdJDjyIQo94Tt65GnKtdXdCZKbLeMYlrfkQOAPDzgYZ+pSwR/N1958uRIbRczS03D2Fm
 ktZ9s8y6yin+eUuBRRcgb3Lh3krnhkDQLfoRznKVwoctwWIDgIWABLYEajJl7jCHadKl
 YtMZfBKdkP6h8edJS0GvMMMUgYbpkDfJXji3gJIaEyjpPEUxr8BZze8kqeAdnvsilHy2
 r4Tg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785944213; x=1786549013; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dcVDqOBD+RYP8gAP5Yk2CFuORvHnd74U/mYR1CF/7zE=;
 b=EFCUV2I7MYdMGiOlnv/6KzenXyfMd1ne5s9/qHgbuXfxirWY4aO6mSUjlCe7GmlcI8
 I/LSwNNxocmjBstDYb8hHWEpES+Sjqz7xhfp2x2GObJfz2cQq1T5J9V5+rrOyUsZ2aof
 f6Qv1DtQH71iZFUzN79Fc1aM63g67wSwpEVa7mP1Z0ISjQd4Lb5ZoOrjahV0Xnbsvogi
 2ZFtJT3MWwnHgd6YA37oKeBN9+mCNI8FsL1V7oWf05fGy/tNd5x4LCUkCty0Dwf749AX
 6Mv2nAjzOVlI4+NXOM3Gv7CdGWrmKUcZVoWWrUWLPgxaFVP7kDsHDAk04xVbepbKrBXy
 vN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785944213; x=1786549013;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dcVDqOBD+RYP8gAP5Yk2CFuORvHnd74U/mYR1CF/7zE=;
 b=a7ojt9Ilof3+l4i7CzMFtN1SsqIfomHbUgXTnISfQYVLTzAqlfO2f+6aLlPZod1jBz
 OoWNqJMn9bKmYpyz7i6tjbtmgaZfPEYvpNv1+EsQrUkB5KB7208OvUuPq+91mC8GWwDQ
 9OtAA90/4pNMFlDtzyMeDCy7rVnVxPZ5bgkzlahaz8a16rCUzS+OyeXIXAQkk7eZZWWg
 nhyUQGw2H11gx97qT9xTXpeTNEtdtPbmWxaSCB34MnY9END6BBwLDGxqEu4OVQQF8T0J
 Yv//oZCme0cAarrnHMiJtjqbdQNyu3WWdEGuz5K0tNc00oviT4LxLXBiSfnWbqI1SD6f
 olxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQcKMQi6zAPcYZL4e2RrptLaKtQTqOeNktkx9WUi1w1xJuiDtsrKpsD2XSJEe7e9P+pPnvFXOt/so2@nongnu.org
X-Gm-Message-State: AOJu0YxDpuqHTqZUjO8MliqcodZuuGcZ+m/qAhn3glKYMbV06G5FR6AL
 xN5dVQwFDdH/HDvre5g9sKzXbWLAc79VLDBqjFe6W/McZ/ZbotA3wD7H23beYr0+J5tbNQ7tnio
 QLdoKKS9f0I18BGKvynJhhuOJIiMaxMY=
X-Gm-Gg: AR+sD12l/RU+SA5cgmtOMhgdDrPTSdoMyZE7ozjks6m+OAz07sPaQnWFGxfDeAw3rMj
 QqCpYRfr0m3/eBBmhcquatj/tvIERwAH7Y7++vpYsyD3r4EkANtv2bUpKRFmAhid3rOhlrMxWyz
 slIqQGFr2+ZmIzUBDpPCWn9e30FeGh2uwzqxwqnVVKG8hhIdKRztrR8CmPgPkE9tBi4D4yMfTYM
 hqj7O+WMNWIRpXovx3+c7Y15QYM8S4VBsKgCzuXG5OFnv/8nYY2HjbbYxmXlJRnL8NpU+8TyoSz
 BgsS7lMV42x4AagivfCiPQ18mWSqvos8Get8BeF1Kw==
X-Received: by 2002:a05:690e:408d:b0:667:c09c:4a40 with SMTP id
 956f58d0204a3-6699ab8eaf8mr4761596d50.51.1785944213312; Wed, 05 Aug 2026
 08:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260801192848.30606-1-flamboyant.h.01@gmail.com>
 <20260801192848.30606-2-flamboyant.h.01@gmail.com>
 <itp7xmctqnac4c7kytqyrrs3xbfnbjprem6ezlltc6b5ncdpdn@6pypq3e7lbog>
 <CAAW0U4a-nG-ck4g8w0_Vt1Jbu5dNcYEDjJNR-YvGEiHa9G4Rdw@mail.gmail.com>
 <CAEev2e8UcXn46OoyqTXpx8-_PzUNyGJDVF094J+boLUSqQ3VLw@mail.gmail.com>
In-Reply-To: <CAEev2e8UcXn46OoyqTXpx8-_PzUNyGJDVF094J+boLUSqQ3VLw@mail.gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Wed, 5 Aug 2026 23:36:42 +0800
X-Gm-Features: AUfX_mwtx1eBucGDkJh-NGFymJ5SHIWUBRX65d3a40fABZXcAO7IOIUNzhBuP9s
Message-ID: <CAAW0U4a95WEHCY87mN7WncHg9buiiw0YsdO4VFTroONe3XWFbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/ssi: Add Synopsys DesignWare SSI standard PIO
 controller
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi,
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> =E4=BA=8E2026=E5=B9=B4=
8=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 23:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Sounds good. I wouldn't worry about supporting dw-apb-ssi.
     Thank you. I will fix  in the next version.
Regards,
Kangjie

