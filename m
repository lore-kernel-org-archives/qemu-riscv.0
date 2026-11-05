Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqvyeyuq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP04j-0008UY-Ti; Thu, 05 Nov 2026 11:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP04i-0008Tw-3J
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:12:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP04g-0006eW-F5
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:12:27 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4922523d1afso266786f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793895145; x=1794499945; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cThoCKzcNWHWVRzxPBiXG6CPz0sEKxtSG0WvkJPGTrw=;
 b=pqvyeyuqW0tqJCAB6SxmsTaiQqQh355PxQoQXef1D1efph0spVmdakv1MDtMyAMwx8
 UxFEJ3fUDOz+rQwVrVPvFmOCo/Y+jG7TFuDS36vPsJNXxKYQtUZ4x9JI8bMK7/Hs4tN6
 qvV/SMfFLZO7ehhepgmzUQOVn7boaaPKQKJO14eUvQ9JFmJctkeVSmreKZ6eZGxa2c0z
 FKeuDaJYP4KAXLGucrjFaDFXzZPkFH/sVeakDiaVf+vQK6kj/isZ2WRShGgU2dlwWZck
 qWBXjRmviiCk4OB9pJaFX99k0qk1A8rx7npP9+63eQqwwBt8oVRSwhfdq4LvTo7MWCXW
 ewCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793895145; x=1794499945;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cThoCKzcNWHWVRzxPBiXG6CPz0sEKxtSG0WvkJPGTrw=;
 b=0HZhAZJsdzDOWyrQjjTODn3nAZc25mD+JE92aV1RmIlaTUglLQnGvW5qCvpvU/csUY
 ZgaMVw/N0goEtaBdNRshQRlYc8N26JJI/t2gW32qv1TIXpVliLDhz22faZWmeHOka89n
 Zd9W5Uk9lI3O9t06u1mnPYOKZuSFsAhuDds8hwM7eDddD1fHNx2QKE5df+ugWO6Z85Hb
 H64JBpYYyxsLdhQvN5im0luNeO1+0g6BQ125qpdd6ExGBTT+7fwzTYDi8rOuHtROPPmT
 7hDmF5rAI/sfbv9IKRCCSOrikV/iwJUHTkKTyJGZtdPYPWm5NgIxWAZTWInQbJSD8sad
 mJ+w==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3jcLmhUk7uXHV5WVgJdRhYhMtGLuvcHknIkxpmyNGq6+BsU/QawPslhwAOoiWn69bPxeIVj6YeDa5@nongnu.org
X-Gm-Message-State: APuU4Z+F14Qvn1n1Iyf2usDrE7zpdOryk3eNf/2hJxT8Yhx1ZBMAot5k
 PExzIxjdTZFZ96eP9alVGYUntOsKBELNmWesdV4eqQMo902Uk7Y0CDMyGOP58k4hgqA=
X-Gm-Gg: AYBFou1o/sOs7hq7Hel4WVf7UVVz+1oG+aYjccKZFNkcURJIYxN/lmtOSWWp7AVyky3
 MeqMV62lEguSsGuAasAtaLGqmvkMV7sH6NS3uv0Rb5oOedB5WoXvI6lG/j++VZ470hvd1PcHWzL
 wBbOBl085vvEbcyk73Tqo6ZpQ07BcwaBWRdMAxGQa+H7DpURF4DArrW2TrUQbMN4z6Xa76L766C
 SvtIigNG0Nl28lHRB1mOY9H3ZdobLsO7B4W+Fh1EgBiY6dY1Q3Dt4axe0gyndINGu5v9orjwDeo
 I17D2K688fGlKalq7lOuSRqKr2tThNeW/kVBxkec6vj1XcY9uZEWkY0rWlZT9FMtQxKHK4rVT+K
 MqlZrIoT5ydC+HdyAxBQOLnvVPxEFCmePnyMeiREeFX/So42OMMBlOrTf0ygiooQybkthuLKl16
 r0Mut6w2oDDvxE5jb47SyvhFYqrUYe/ivLSxAt+Lvl6cNpqEVF4b37FHC5N7UZspFijrrgRUii5
 e7cw493hjrRfIlrTzZtOuFsrF4bQbkEBkS0++8/rLa5/30/lWuGHjkAUM6bFDnO/k9UAIC4LHPO
 kbfXCyBm9WfN0i6D5ujqf3R/vFnI
X-Received: by 2002:a05:6000:2486:b0:48d:ff81:5201 with SMTP id
 ffacd0b85a97d-49277f88144mr107115f8f.41.1793895144611; 
 Thu, 05 Nov 2026 08:12:24 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feeb5196esm9849698f8f.58.2026.11.05.08.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:12:23 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B5EE45F8AF;
 Thu, 05 Nov 2026 16:12:22 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Stefan Weil <sw@weilnetz.de>,  Jason Wang
 <jasowangio@gmail.com>
Subject: Re: [PATCH v2 10/17] hw/net/eepro100: Replace deprecated sprintf()
 with snprintf()
In-Reply-To: <20261105125203.40320-11-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:55
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-11-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:12:22 +0000
Message-ID: <87wlqr5kbd.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer snprintf() to format debug dump
> silencing -Wdeprecated-declarations produced by Apple clang
> 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/net/eepro100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index aaa3eb60f8ab..44eff5fd3ad8 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -369,7 +369,7 @@ static const char *nic_dump(const uint8_t * buf, unsi=
gned size)
>          size =3D 16;
>      }
>      while (size-- > 0) {
> -        p +=3D sprintf(p, " %02x", *buf++);
> +        p +=3D snprintf(p, sizeof(dump) - (p - dump), " %02x", *buf++);

I was going to say the whole function could be re-done to avoid the
static buffer in nic_dump but that took me to TRACE and then missing() and
I realised you probably didn't sign up to modernise the eepro100
emulation ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>      }
>      return dump;
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

