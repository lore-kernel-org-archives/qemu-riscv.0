Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E9AC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:39:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1OTn-0005CM-I9; Tue, 23 May 2023 05:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q1OTl-0005BM-GN
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:38:53 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q1OTj-0007yU-OJ
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:38:53 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-55554c33bf3so1163328eaf.2
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684834730; x=1687426730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6z3lMGxH6Mz7+Fn/T4LYytMshUBzmp0MZ7SoDpV31I=;
 b=AMeKxWPLAfExFxJB/0pFuUFEiXN+50+SPDOH4XHy6mpSblEnrvX5T4wWHVkOgl2LP5
 wKCrtEhSYOeRjQVsEEAMbGheO6riK1oW2/ZbezvQrNFINT7x4ETrELaqjV6VRddeLoES
 7NKC8FBFPgJ5OTX8YbW5GFwVWTl0Uq7HiaIwakPUp1YU2svnE+zLhg/XSveCCReEKAVC
 hxo8s1qdeX09joUdCGs8jWtIrYgj5ppyUVS5wlS4gl2Iqda5R6VlUW7iSV/gIDGqVQZU
 2oJtnoMoEVZBeVDe9sF5nzsToRIjCrsINtx7ylnAYEmtAQf4jn+yxY9A6Jg66DOGtrHf
 8Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684834730; x=1687426730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6z3lMGxH6Mz7+Fn/T4LYytMshUBzmp0MZ7SoDpV31I=;
 b=BVJpVF/swVwVBsWwIHYDIkSOXifT0MsiaotFrtzpcE6nBFjfvgNFfeAkkNJMzfzrWu
 WNoMcTsUQDf+3GN7JVB6mKNem/kLzdwhgQlbiSlycfom22LcwBFdUx5pYRvUd/QMq2wT
 8vTF/2Few4jNF8g9k63kEewbdQozOHKEK+1uabRtNOJKQsS8AFdYK3hC6KNMkcfDTkhu
 qyfkokVUT+PF3FJxXcah50loJHdE8MXA7d91G4az0Hvdr6cKbAZgUzpqPCC+0FTirCCJ
 MnOO31+VSCOmflERZcbSaviFOqoHLP4qb/yK/IBD5GifPA44v4/A79D3Q9vn45LSFsR5
 yKPA==
X-Gm-Message-State: AC+VfDw81Qcb8agOmKwNQ1n/IQq4T0ulGcNLEz0eoF3accoTWwup3Csc
 ffVGM+G2EYrYM05Zgb3JgeVeHDZYWPnhbxFhbh8KgQ==
X-Google-Smtp-Source: ACHHUZ590ivdXOBK8DVn/lntOQYNQicJN9rrix/NpCdyreZpkdnN9TcSNijcVkPKccvqAJg6nDXarvxDZKkcTuOZh9I=
X-Received: by 2002:a4a:92dd:0:b0:555:39b5:c7fc with SMTP id
 j29-20020a4a92dd000000b0055539b5c7fcmr3187082ooh.6.1684834730118; Tue, 23 May
 2023 02:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-2-yongxuan.wang@sifive.com>
 <20230505101707.495251a2.alex.williamson@redhat.com>
 <878rdze0fx.fsf@redhat.com>
In-Reply-To: <878rdze0fx.fsf@redhat.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 23 May 2023 17:38:40 +0800
Message-ID: <CAMWQL2gDRcawsLLVUpL5dV1nXGKBqWiE_6SSgOw8+ZgLjgO8rw@mail.gmail.com>
Subject: Re: [PTACH v2 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support
To: Cornelia Huck <cohuck@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, rkanwal@rivosinc.com, anup@brainfault.org, 
 dbarboza@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com, 
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, May 8, 2023 at 3:39=E2=80=AFPM Cornelia Huck <cohuck@redhat.com> wr=
ote:
>
> On Fri, May 05 2023, Alex Williamson <alex.williamson@redhat.com> wrote:
>
> > On Fri,  5 May 2023 11:39:36 +0000
> > Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> >
> >> Update the linux headers to get the latest KVM RISC-V headers with AIA=
 support
> >> by the scripts/update-linux-headers.sh.
> >> The linux headers is comes from the riscv_aia_v1 branch available at
> >> https://github.com/avpatel/linux.git. It hasn't merged into the mainli=
ne kernel.
> >
> > Updating linux-headers outside of code accepted to mainline gets a down
> > vote from me.  This sets a poor precedent and can potentially lead to
> > complicated compatibility issues.  Thanks,
> >
> > Alex
>
> Indeed, this needs to be clearly marked as a placeholder patch, and
> replaced with a proper header sync after the changes hit the mainline
> kernel.
>

Hi Alex and Cornelia,

We found that the changes are from 2 different patchsets.

[1] https://lore.kernel.org/lkml/20230404153452.2405681-1-apatel@ventanamic=
ro.com/
[2] https://www.spinics.net/lists/kernel/msg4791872.html

Patchset 1 is already merged into mainline kernel in v6.4-rc1 and
patchset 2 is not.
Maybe we can split them into two placeholder patches?

Regards,
Yong-Xuan

