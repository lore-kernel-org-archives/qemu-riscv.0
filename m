Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2900C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 06:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wulNz-0003lF-K3; Fri, 14 Aug 2026 02:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wulNy-0003kp-Iy
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 02:27:22 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wulNw-0000IF-Vj
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 02:27:22 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66b35d2c4edso912575d50.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 23:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786688839; cv=none;
 d=google.com; s=arc-20260327;
 b=no2g06sKkfkyZYzU3Rik12lfhZ7y2dxrWQhDDwLKfAMAvISVlcMY7njxZK1w2ETIyW
 R3AQDgBA+KKXEYBT1Pai/DmBkQ6wTNvA6A5wLo3z7S8hzxrEKB1aIRI6ZSmaPCsvCv7G
 Z0PlR3bC3+oqbSqJKIG8hkXzUcVM9Q2c0FfmwrGjZmhimAYJW5rwiq2pmJkjVvg9v6Dt
 ViKZ94SokN/SREDrG2JwyymnufSmCSACYvaF7nItTREKNCCYn77Ekil9tIZpa/7qQx1s
 xLU/8YIlpz2v+nmP2naDQ7i3gN0j22D8fMxNrRusrZ5MvHvDLldHXmOp4F07gfaLMleF
 NlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=n0JefToRXoa94zkgelvodnsgO8JO8c7B1OGjyZtdl6w=;
 fh=Z1+pj5TD0SN0o7pQpCeTNYBC/3sz90zPiEamknV9MJo=;
 b=S/+fi69hpoUI6nmIU72KnQSftxkn3/61xG/I5aGiTcYiBODaEop2YYybg9utP9aYS6
 lRLpggGcAma/zeH2FDzAn79m3TVVlWdRw1g/badZou4yDqacRrwwj+E+QQe97GPXFBO5
 mVG6hW7R7ywYdhwlp1RahjsLA9/Nc2t+4pajnMi9mzggROJFg9yLQYA84GI1MTH8fOnx
 3uu2SijzVrWUsdaepiFM8sL8irz0GI8Yc5qCZ3ztsTucY+5gwT7maS6Rtb0BPrK+vjD5
 J6rzXrBbM4ZowaLkNYD8EeaI/NErKrzg0ovhSx/MjowpItyeotkf6nRIa85eMWxhdJrX
 H7lQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786688839; x=1787293639; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n0JefToRXoa94zkgelvodnsgO8JO8c7B1OGjyZtdl6w=;
 b=U+LcYfc1Z6CJxTyL9sY/O2UCFxhDmsf6s7V+4CLDii4EloBTHsBEYn0e6sZeFTzkAJ
 IGAOptiKDSR9ZaY7s9UmY8St1D38SYJmJKR6NK/gHWGTs9UP5tF17XTXAYIg1s1k+gKU
 O4+6G/kNqE0dOgR9R8sWYt7mor5Ff+AyBCKtRGiCpYvzFfpo6ccwfgmBeEbXo6ZACxM0
 OVkz1d5QbG8goc6w06IvoZbxxpeL3tUc+w7C16O1n70NeBazfuNfafTYH2nnR7ov9G1m
 /amxR2ibrnoEK3vxWiiTuDhiUZAJJwW/knTE8jqU5Yb7rJ8KNNJvb3uO6yBazK5jmWC3
 8Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786688839; x=1787293639;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n0JefToRXoa94zkgelvodnsgO8JO8c7B1OGjyZtdl6w=;
 b=n464Y1LVPN6ga10XhgrIf3LpHCZBG27GagqiI0ZyqRpBP964XlJPjdvupBc7+ORB/p
 /d9ecbZpE8pGRzGpgOmTFtxAcPqw8zY25mlLg+qXS58bLfGGgHSSKr6JWXRLmCS88X/Z
 9y+3axasVKzfJKK/92C+aleIVMI29dICm97vGmNDsNjiGLpYI4SMVETzxTVMsJqljYMy
 +6UFdRPdxM9aPMToH1jriGu2UTOIpNXmXLb7eWOgRGgy4SqZWPPv1RK16OhE/70/1hb9
 HjLn7rOtamllCGQRsM68sluiRSih1TutLMKJtRBuq04G2avp0Ztr79ArzlqfV/pEpCZp
 Nr4w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrkbjoSmVmQx9RCAwATfZyE90o7CCgMUQtJML3DvDdC9XiGnSywwUYnXT+KYf9crXZrWdXMXT5LYj+m@nongnu.org
X-Gm-Message-State: AOJu0Yxbo0LtiUE6QhXN2lVaGFo6CJ4uDJyx6LeAggN40PvK+u2Vw9NW
 7hdW9njjQ8W2rIPIxC3H1qmJsi3ypudXdOskur5jRfT4hcFP86e1Quk0h4KAHAsBwwnYK6CXJr9
 J1unPZtcvXRB4jIugC25t6ilFkAn7W3A=
X-Gm-Gg: AR+sD127ehCu6WgQuztCIZFOhgRQc88BADgOxArmnCQGgkSaOw+tBttOwEQp0+2I9pP
 vGQ83GFIsWJt5tN5e1/FeGt/A51rJAkFSja/SC9TCe+0rsvE7kfmvEbhrqd89yzpyFTV/Brlus5
 83njUOp+zsIXkgQvpJCUwQchuc7kCaULBZUWjiM1tTSbCvwkyKBMPha74xEi4BrvtP6HIiJVvje
 hVn/snysuqXRnNdPjGPMQ+LU5x4cJ4Vxvsdp+pnntgnBPz20xbvd3U4YwEdk48YxW/b5B6zFFCz
 HpPLKhNDez+4L5RRp4QbXNNslm9N7EGhRKJk9AkE8Sqm
X-Received: by 2002:a05:690e:400c:b0:667:b72c:8119 with SMTP id
 956f58d0204a3-66c72d050a3mr1368723d50.43.1786688839479; Thu, 13 Aug 2026
 23:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
 <CACPK8Xfgj+AUx0h_46f=qG_UEE_o7kTZ0=Buxr7+bdHDODHpgw@mail.gmail.com>
In-Reply-To: <CACPK8Xfgj+AUx0h_46f=qG_UEE_o7kTZ0=Buxr7+bdHDODHpgw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 14:27:07 +0800
X-Gm-Features: AUfX_mxNooVMH4UKHzKpa-pDdVOIMpBd1wwtGHT_cczRMT6ELJ8fa1wKoS15Ohk
Message-ID: <CAEUhbmWJzY4qZA6DvTKu3gbP=BEe_Byw6+cpiKEruvVCyL-jiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: Add K230 DW 8250-compatible UART
To: Joel Stanley <joel@jms.id.au>
Cc: WX Chen <wxchen0913@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 13, 2026 at 6:21=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> On Sat, 8 Aug 2026 at 12:02, WX Chen <wxchen0913@gmail.com> wrote:
> >
> > This series adds a QEMU model for the K230 SoC DesignWare 8250-compatib=
le
> > UART controller, wires it into the K230 SoC, and adds qtest coverage.
> >
> > The implementation supports the registers and features required by the
> > Linux 8250_dw driver, providing an interactive shell over the serial po=
rt.
>
> This is a model for the same hardware as this patch:
>
> https://lore.kernel.org/qemu-riscv/20260616190147.1286316-2-visitorckw@gm=
ail.com/
>
> I'm not fussed which one we end up with in the tree, but it would be
> good to name it generically so other machines can use it.
>

Agree.

Hi Alistair,

I suggest we drop the series from your riscv-to-apply.next tree and
ask WX Chen to respin another version.

The DesignWare series IP should be modeled separately instead of the
SoC version to allow other machines to re-use the same DW IP.

Regards,
Bin

