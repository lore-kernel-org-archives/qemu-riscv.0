Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHa7R-0006yY-WC
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa7P-0006y7-Pl
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa7O-0005Kp-EZ
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:32:51 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40565)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHa7O-0005Jj-9z
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:32:50 -0400
Received: by mail-oi1-x243.google.com with SMTP id y71so6954410oia.7
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4bQJElQtxExdNClri0m5sgcXCnjLo99SHgCzJWX7tCU=;
 b=r4wtG65F0C2G/xy8cnOso46Q1Kq9XK70ovOONPapRMhNsSTuv8jehWPG+LVe/Ur5XM
 WKXO94T1RtNgqdsNJe6O4LV5kApbV90934Vdxwu+tQKu2+PtJJGYHS+Ak+WFEtTaBZ+q
 f0bXdqljRCWtsNrJTyAvVqyqYWKE4cbCK/ODpn2ZDRivd5bWzbuQgNqJWDCpVgfOz5IS
 i0lDaz5iDOjoyMnjN+kRfRpAlFcjCyHpZo6rChP7yq5mnwsq4B4RkMuvTyBO/zYYiQdt
 vvF9U2Gcfcu8z5DKVhxyWCKWyfGiGzxISq013pYrAGpzAOZxGFG0lIZj57dUOIjWgulU
 WjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4bQJElQtxExdNClri0m5sgcXCnjLo99SHgCzJWX7tCU=;
 b=YugKpaFdLeUp6fikDtTovOjLwlvAANrx1Wt8ypDhcl7GncvdKGTimw6lUbYr/rr/t/
 tF4kSjmlUJI3axLX/YztsRulwjGu30oKa8Bz4bFkIWpBs26SK4i0d9S8IWegwPVEVHDy
 KOJSSHOG4+0hn0PKN1wm46G1rBD2tAic/d7J3kUqLCbMjY2HnGmkwSXl0jfwHtpuzVUD
 GDvaUa/3Sv6BUWj8HmzyBrVpb756KrfaeQkkIJajDjvqR/UfqtqvY7vYQq5wS16c27QO
 5FVUt313rbTfL6rJuBFKj6GqYZ852WChVw3Wa2GX/yHbUGnrozYjh7B3IawBBl59PhKB
 7p4w==
X-Gm-Message-State: ANhLgQ2NzsQglM4pB8fgI6dJvqiE0yicVPpZXhH0Zavbpr1QaAz6ADWW
 gIDOPgkES/ztBe2Ma8+UEYzgys3tFd77Mvvg0zH3kg==
X-Google-Smtp-Source: ADFU+vvf9kTUVpIi/Ws1MPcDpRPXqP2YiW6XL3c5jo14iT1qdSeGyaKyAFE+hAaYg+sm1UnThkUV9gbDgfNnMCGGA6w=
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1790415oih.146.1585258368267; 
 Thu, 26 Mar 2020 14:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-2-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:32:36 +0000
Message-ID: <CAFEAcA9qmwCmu-0OmNF-TkXzdd3qrhPxQRO6DS36X=Up2g4QoQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 01/12] scripts/coccinelle: Add script to catch
 missing error_propagate() calls
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2020 21:32:53 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> In some places in we put an error into a local Error*, but forget
> to check for failure and pass it back to the caller.
> Add a Coccinelle patch to catch automatically add the missing code.
>
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

This coccinelle script is impressively deep magic...
My general rule with cocci scripts is that if they serve
the purpose they're written for then that's sufficient
and they're not worth trying to polish further, but just
for my own education I have some questions below about how
this one works.

> +@match exists@
> +typedef Error;
> +Error *err;

I didn't realize you could do this kind of "this thing
must be this type" stuff in the metavariable declaration
section...

> +identifier func, errp;
> +identifier object_property_set_type1 =3D~ "^object_property_set_.*";
> +identifier object_property_set_type2 =3D~ "^object_property_set_.*";

If we relax this so that we just look for "anything that takes
an &err as its final argument" do we hit way too many false
positives ?

> +expression obj;
> +@@
> +void func(..., Error **errp)
> +{
> + <+...
> + object_property_set_type1(obj, ..., &err);
> + ... when !=3D err

This 'when' clause means "match only when the code doesn't
touch 'err' anywhere between the two calls", right?

> + object_property_set_type2(obj, ..., &err);
> + ...+>
> +}
> +
> +@@
> +Error *match.err;
> +identifier match.errp;
> +identifier match.object_property_set_type1;
> +expression match.obj;
> +@@
> + object_property_set_type1(obj, ..., &err);
> ++if (err) {
> ++    error_propagate(errp, err);
> ++    return;
> ++}

Is there a reason we can't do the substitution
in the same rule we were using to find the match,
or was it just easier this way/done this way in
some other example you were following ?

> +
> +@manual depends on never match@
> +Error *err;
> +identifier object_property_set_type1 =3D~ "^object_property_set_.*";
> +identifier object_property_set_type2 =3D~ "^object_property_set_.*";
> +position p;
> +@@
> + object_property_set_type1@p(..., &err);
> + ... when !=3D err
> + object_property_set_type2(..., &err);
> +
> +@script:python@
> +f << manual.object_property_set_type1;
> +p << manual.p;
> +@@
> +print("[[manual check required: "
> +      "error_propagate() might be missing in {}() {}:{}:{}]]".format(
> +            f, p[0].file, p[0].line, p[0].column))

Nice to have an example of how to do a "find these things
and print a diagnostic". This 'manual' match is handling
the cases where we got two consecutive uses of &err but
not in a function that took "Error *errp", yes?

thanks
-- PMM

