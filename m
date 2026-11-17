Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572C606A329
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=WnCeTLgc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFCJ-0006SN-Ks; Tue, 17 Nov 2026 04:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFCF-0006Rv-IC
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:09:48 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFCD-0000oQ-Q7
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:09:47 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b4bd3d98bfso5990007a12.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794906584; x=1795511384; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HaDc8I7Sj2QN4PF0OJdn+37ksGbDX+3NQt15e0saoKI=;
 b=WnCeTLgcs1VWZnEDbSWaOUspmwo9VDfm4dTejO1EflZN03UJB3G0lFTLr5zA9giOsV
 rB2DFwg00XQyPr0ykCRo1D/C4aGq3kbUvOLeC5Mt0/GN/F25e4Hn4eamBtMH7Iz1wWom
 g2+JsR5nc2n3l0ZTuU4msZnyhh2Gu1u0FO6dew8B648qwCfO/QZ5TqN0FCPEyTkkPDYT
 0LhhyC54au6TsPyq6hLFAeIrDquVm2OvPPxczKXfy3vv5tKIYuvfD+a81XQTKj/4Tkjt
 Gl7UDwTZLbE/1GXK56uIv0zMWYpNfs2Uxd9LKZmfRS+EX0w/ZZRhPlyQ9naiHJDbI0N2
 TQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794906584; x=1795511384;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HaDc8I7Sj2QN4PF0OJdn+37ksGbDX+3NQt15e0saoKI=;
 b=ZDEeyHqLuszmFLZRIdTbuD3Q3PS9kdp/JvQfEmjgi+6ARMWTkch+QEhmsncS4FV+nu
 IcyzXk2MNV5g89UTbB4zzZaMypyr/J4xOEHoAdbaiqhSBLPRYtIzbxfySHkEfryJ7awr
 MgXnA49EDib7inH6nbdbkfnuFpZEN/wPq2zJikxJRSVe26Bk8rWAq8qhP/lHBV1rb4ex
 TnUbIVVYg9VHgJyn6MpsRvl0naofTMX2Ai7saUVPa0hLUT5ib1AQl3pfP9eVxcm8qxQi
 98Bm6bdTV8lgzd3K+wog+h54bb6zjSepj2hki3GBmlSqjDXmlX+L8WPvqvgK6YLX1ehj
 i6lg==
X-Forwarded-Encrypted: i=1;
 AL+hErEtWuUy3H7MWt/GFYd60AogW6l5HsAMrUQTvDb2mod+IFXRVqPhlG55h7/ZpV5u9aA+Vdvoh5t+d2zD@nongnu.org
X-Gm-Message-State: APuU4Z8yHOfQ/IHdaa9YJLrKyhoUdSoUCL0NNRUo5JjJJIB8ANEL26qS
 IWv7QACi4mOTowXPS2TKTT08O0zJ/aQ+KOQ63ZN8yBqkPq5pcFb61C826eBeLXIWLcWplISFe8n
 whSH5TPg0z8XjX9a8NInjtn+MasazLVCBsie1JQjWMMLA5V19XF2R9X+UKeufoqdPFXB7mmWkzL
 EQOlurQlnstrh1zfOWGd8sY6briOEbNV7CxVKqftIPqJs=
X-Gm-Gg: AYBFou2CRe6b0J5vFuzgHMtVJ9eZtkXPBoMwqlM9Tpe9Ul2Bqokj+r1XGwNZZcFBvUU
 eLjQe8CtMfxTfYekiJu0qtuqfmnJp5f3eNKXcKvmOX2fo2SCZMzScueX7dryXZLfz3WS8hAd66X
 spA2rTcOrNUnVQba+v0nwOO8GkVOabyqsKBGuRMURUK7hFN60qPZZvykWmGR97vMrjFrL91fRhJ
 /KkskHVuQ34djhHkDj5HUUEY2ZuXHXjYKXEYUW8OkVPFpGUY4/xoUg8awswq74B3BUfUZPijz1F
 9To3CE+1SP+zPf5+WYrlBa7mVgB1mDaSgYqXvROVDjQeVHinqqOTYl+wLkSZnTqN5iw45yjDtKT
 aBBtfAFfy5davbjoOlSpuMdWE1qaZDo/nD/2hkIv9rcW4moYV4DQeKl8zNfwhv2cQhE8r90AHDH
 FE2lIHi1KRU3xmL1NjWnpcZDY2ipzE28nJypf3URdgwHDmNmm5aRZLAd+c4x6GBHkJfunhW3Pxf
 Vcd0VXNWM6lQ6vmT2bxnfSJQTo+Wwi2W9CLQap656dA3hlp2OAqR5CcBYF9mbk5gPmBsu6KbBHL
 RMbHrYnb4Y9WLy9KJgj7pFLomws+0mi8xkcL7TNO3/Tm3Fc5xvB+xdqcggOhvLwiG/7I
X-Received: by 2002:aa7:c0d3:0:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6b7c0c46a5fmr7833928a12.32.1794906583996; 
 Tue, 17 Nov 2026 01:09:43 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c6a5924bsm5347289a12.18.2026.11.17.01.09.43
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:09:43 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6b87a92c17eso139597a12.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:09:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErGYI0bvCeypTNmy5UsCAlAz7llg8sb/8C5tTfWMFToIMSNUHWYTFruSIpWbq/VQFA8yzoP2TLCxJwn4@nongnu.org
X-Received: by 2002:a05:6402:a508:10b0:6b7:a5a4:7205 with SMTP id
 4fb4d7f45d1cf-6b7c0953abcmr7108117a12.12.1794906582850; Tue, 17 Nov 2026
 01:09:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-3-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-3-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:09:31 +0800
X-Gmail-Original-Message-ID: <CAMXXpfb2ivefcvD8ev-Q4Zu=UqrptCihGzmUFiptpnb4b=PnNQ@mail.gmail.com>
X-Gm-Features: AclHuK9StGEbF6ZBjtfboL-7rJmqyD8zQI9bR-_XVm7q_LANkqNqJiPO3Vg966g
Message-ID: <CAMXXpfb2ivefcvD8ev-Q4Zu=UqrptCihGzmUFiptpnb4b=PnNQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] hw/riscv: add n-trace encoder with ProgTraceSync
 message
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="00000000000046a285066075413d"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000046a285066075413d
Content-Type: text/plain; charset="UTF-8"

> +    if (packed_bit != 0) {
> +        /* last chunk was not finished, so finish it now */
> +        buf[buf_byte++] = packed_cur;
> +    }
>

Although current payloads end with a FIELD_VAR, so this path is normally
bypassed, a message ending with a partial fixed field would reach it.
packed_cur must be shifted into the MDO bits before setting MSEO; otherwise
the MSEO update overwrites its lower data bits.
buf[buf_byte++] = packed_cur << MSEO_BITS_NUM;

Thanks
Jay Chang

--00000000000046a285066075413d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0=
 =C2=A0 if (packed_bit !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* last chunk was not finished, so finish it n=
ow */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[buf_byte++] =3D packed_cur;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br>Although current payloads end wit=
h a FIELD_VAR, so this path is normally bypassed, a message ending with a p=
artial fixed field would reach it. packed_cur must be shifted into the MDO =
bits before setting MSEO; otherwise the MSEO update overwrites its lower da=
ta bits.<br>buf[buf_byte++] =3D packed_cur &lt;&lt; MSEO_BITS_NUM;<br><br>T=
hanks<br>Jay Chang</div></div></div>

--00000000000046a285066075413d--

