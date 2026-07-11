Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F2C43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 11:04:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiVVV-0000k6-Iw; Sat, 11 Jul 2026 07:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wiVVU-0000jW-ST
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 07:04:28 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wiVVT-0008RU-1G
 for qemu-riscv@nongnu.org; Sat, 11 Jul 2026 07:04:28 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-664a09bc459so2531995d50.1
 for <qemu-riscv@nongnu.org>; Sat, 11 Jul 2026 04:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783767865; cv=none;
 d=google.com; s=arc-20260327;
 b=gZEhlJzcgwPO2cdSmublbXRShxT4+PDK8KTRo2O1C7j2uyoJ4ncRECy/XVB9vx36Qk
 3TKPuLFaaGWV7qGVu0vsOpbDHSJHIh/0lV2fKn4tpmtuvLxWrd5svOaDF+KPBZip55kL
 wIr0sScDBJg2FCNioVO3GXR91yxITKkgZoldVrGY9n5njCwulMgqw+md0aQGzVqf6hnN
 m93jjKswEZGo7on3An5LOKWTIQxjCYrKJxdX2ZbgfAhf6eajqQg/D6rHdHuWyK481EL6
 a4+3ujGfphFLD3crj0ZU4QoV9QDNMlen+MZtNCyuVDAX1MRRttoV586z+10MbhhLn6/F
 cjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NLECCsMWXnqpvQBUgmVChXHrgMKE08qUHwIWNPzAbKM=;
 fh=Rj0nQ6DHEZZyqdvbRC4JAe4tzJFusjT4rPF8+kpFZG0=;
 b=muxoyv8j7u+If8iZnt1Gw/e3C9C3MwllOus26vBtnJTY4NFWOLjtSwcf24DmqDo+zW
 Spr8xwemRC7UUNJSKT9m2NFu+2vlBvpx88Vjg+xLrDPL/fy2U7BtVI83WZxOD7U7K6w9
 /be91DzVwHYKCgMS30KOk7kwCgpM9m1oeQws+uwcyO1kbulvUdi1XB4v5Z1/ZOhvqyz2
 vjaNWKFVvxsSd2JfqUCV9k0yJOBCeqvMUZkmUQYARQDWKHTZMUhLuanJrrKK0kMa/XoN
 3wlk8ey9oup39sbdyIn3hy+u5R1UMXLgTM2CVQa85wH027GcjOXqaEtjBk0/9eyvixC2
 XE4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783767865; x=1784372665; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NLECCsMWXnqpvQBUgmVChXHrgMKE08qUHwIWNPzAbKM=;
 b=dPBkIn6HmmhDBZ/HoUV2MmhkDVq+k0Y/VnESGUURl2xU1GjvlfYCO8wcuoJIwl3iol
 Vo/3xwmuVOi20Lv1e3jeG7uizH96cV8K1GFNNCi/aXr6bsxPxN3B03P9uf67WJgf+EZ+
 4xruwbqwyr730gwEc4edWFHT2AXZzjqUk9zu80fQdUuddm7YtLqw2lKEgjlNlcR74z8K
 vJ0pi6mZj88wPuEUNCtqbm30LGkrW98NH2bCScl3+fE/k77jKrp6ebHz1aEOKSFJ2ujs
 pktaFBBJCcn8niSYU2WdZmctpfa+lKeee3qt2MG/J2xgRhTcAfbfQX09uWKYJqdOMTFi
 VX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783767865; x=1784372665;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NLECCsMWXnqpvQBUgmVChXHrgMKE08qUHwIWNPzAbKM=;
 b=q3LfQ145aeEh+G0/SSHwzrDjpP9OSXBAYB7PdbU/zUnYnGqgSw7Ea6jW/+F7rHCWyt
 VSX1kwwaUsIPjU4KVN0ANGf9qY9jMBk5eEshfK9rr3LPXQZzO2raXDUJ9RamkFLdIYTT
 xOoI+Bh46sqS3pnm8KWusRMEkp7UoZldeslNI31vQW3o6VIgiYN+VnzZ/k1TUpPqh7jK
 uDw+hBv8hQeqbW9d2GP11DS0C2OubLX5MgxM6a/45UDpi0zSoiO5LbwIQ0ofQtWuF3h0
 l3+1OSo7x7QHvRIXXUCiypTiy8r0NejQHLIKdA9/AM3RqBRLXPSE03p/0FTzwT/a1WXH
 K0gQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1ys2rPuQdEW/TLkyrl+BDiPB8uz8pzl65iFFnXwaK/0xaU5yEUQ+6OsYK2IEb2C3Jxw1xccZuU4ot@nongnu.org
X-Gm-Message-State: AOJu0Yyu6YN/RxKvpvCjtiXlbAQTiMgOivXzfJX9lyANaVY69bobJzQH
 PRdSKDUUdjjnQmZtLL6LAfAo/I/pyxmIvKgHmd8oXB+tbCcVMCtb1MZLVkrphOsEAd+0qHSP9Oy
 S+W3+spY8xNk+1p/v5QxsoiGb4IYepe0=
X-Gm-Gg: AfdE7cnvXZMrcS0meMNTHVRUdcBEaY+BfQ4xVxX0WwGf+GCgcKGh4ccGBUdwoGdFtQd
 4nxDgR+K5tsKZB5QtUMJzUDQFevy8wwn98MFU8kgoSWGYwwgyL2kyytd1nltwGu0M2ztShc+u2P
 hMNFrgqVOFua3qpH5keP3NNCRNrYBVDNORuIv2Ap2hxrIKr7zXl3ydr3aj2bvMP+SxsD83Lgo/0
 JKsiIPpqBCO8xVsWyDO9XDkF1Q16rsEwvwsWr3SsaJMsCD9n4KWOSNVkJkmRyexsJc80aY=
X-Received: by 2002:a05:690e:21d1:b0:664:ae6b:b498 with SMTP id
 956f58d0204a3-667d7c9f133mr1302147d50.77.1783767865460; Sat, 11 Jul 2026
 04:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-2-armbru@redhat.com>
In-Reply-To: <20260710114305.2961898-2-armbru@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Jul 2026 19:04:14 +0800
X-Gm-Features: AVVi8Cfvp826Yl-iAwVGKj0WWndEsEh3T9PRgpIf3rpW0I2JuKzS_dD7a8WM1KI
Message-ID: <CAEUhbmXaA6wpyUeVGL4Vn-zaP9LBFfmpTuWxDB=aMaXez_p=1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Mark "Microchip PolarFire SoC Icicle
 Kit" orphaned
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, qemu-riscv@nongnu.org, 
 bin.meng@processmission.com, mzamazal@redhat.com, mst@redhat.com, 
 sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb132.google.com
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

On Fri, Jul 10, 2026 at 7:44=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Commit 4a16a1a7ad (MAINTAINERS: Remove Bin Meng from RISC-V
> maintainers, 2025-01-28) removed the only M:, but left S: Supported.
> This makes no sense.  Downgrade to S: Orphan.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 576ef6fff5..aa2df9cbe3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1761,7 +1761,7 @@ F: tests/tcg/riscv64/test-crc32.S
>
>  Microchip PolarFire SoC Icicle Kit
>  L: qemu-riscv@nongnu.org
> -S: Supported
> +S: Orphan
>  F: docs/system/riscv/microchip-icicle-kit.rst
>  F: hw/riscv/microchip_pfsoc.c
>  F: hw/char/mchp_pfsoc_mmuart.c
> --

I plan to send a patch series to resurrect PolarFire SoC support.

Regards,
Bin

