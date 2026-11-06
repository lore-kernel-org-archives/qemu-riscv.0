Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC434606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLV8D9F7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPQ84-0002zQ-1S; Fri, 06 Nov 2026 15:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1xPP2v-0006Vf-Tk
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 13:52:18 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1xPP2t-0005wj-2P
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 13:52:17 -0500
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-533202fe429so97881cf.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 10:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793991133; cv=none;
 d=google.com; s=arc-20260327;
 b=PwV9iPstFse2oiIeMcu3gcjYjPBCyguDg4d66+1xKDaQjpXTcKi45Hg1+s80W9Iv7U
 3274gqWlU7+8R4pncrhJeYnFuAubSA6KWKnt4OeNB2yegBYUf+8DUaGA/AShHNBfiKdX
 QgqUyXH2P64Bqx8k3lvImdzEVwAxH+hDO5t7YS6ufTs+lmnHoPgqkerZVzjpdKYDu3Nq
 olvmqn+n47hejn4BA4jiM+LCsJFgvwNaOdj+NujD4JD9+TwKiLs1lgljWsXZKmIzVbHW
 is4SgOIrK8zBhLK/G+3POU0lQnLzcisMkYmhIevG2Y7a2i6oX2y2qiaVwOM59G63iBYJ
 2sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VXXQyV9M1cTPcSVctanj7RtvMiEbV7DDmFFZfiz27bw=;
 fh=k6QPNVmw46NSP/MextcrLG9N8j0TyBxn2s/da2onDuc=;
 b=LXdYCmYjrADMebywYSny6Lgtw/Iswpkd89+co8sC5AvYGQ6cvdJHNSfaCYC4bcAddD
 h79zG1r5BARnRqUPydXoYWcIVJtUY7ispsBw5kZyfFfTxq692XQHhjX2GrtxlrTjI1i8
 SZZAbr8RxPNODoj5ovLOHtzWM1WxTTtzALAZRnNOy7FUvNBhfqq77+4f5dxY5YMtcOou
 D0jicGApaYOXdu9EDEsHP1wNq2qgnOTqkQxavuywQ6eXXPrkrkSfSOtNa0KVafwHLYdj
 BDWRygEvRpLdincdNoKLeTGsxojFFmYnnBGRn7NIOZ0jqhEpd0K8EnkcScn0ERuQ8tcJ
 MrFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1793991133; x=1794595933; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VXXQyV9M1cTPcSVctanj7RtvMiEbV7DDmFFZfiz27bw=;
 b=iLV8D9F7j+Qm1w+wrDvU4yhrfh5jCUroke+Mh6PzoSUegCwCMnw19F2KS97XNVp6LI
 f78Ya1IYt8UggIuhGrRpSeaEDUuLF2HiBledhGA0pjAVtZgxMz2OfJSSX/+kygJdObb7
 n/C0/UaCzILW/ZDYsYi54YCy86a8NO5PWef2rxQfv5QmQPWKnIAaa4XpX3jElbd1ho4S
 soIe48EpYOHuMZNdZq9h6EkdIlldapvC05oVrBEkH3SNwuDDkPpXsVKmc3K2DLAto9ha
 VfiTxBz1LYv2ZLXSWUi5u1pKLl4Xn2sO2lEWx68nIjlKMZDa6ool3NxEXOPfomhE3VOz
 xAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793991133; x=1794595933;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VXXQyV9M1cTPcSVctanj7RtvMiEbV7DDmFFZfiz27bw=;
 b=axXXm8kBnPfBlTxehAUlvfBnbRgZqnZjArg2umb+IeRufbck0np1KP97HgUttp9uzF
 74HDJ/KWJZPKZUk5aEY6aigupoyvVXK6dB8NEKSLYf8jS5o/ByWoJHs0mKMEYdMfCHdF
 JNZPDRfqQ/e1iocbbTibUoRXQOrMhRrZCgkEiiJBqXvL6YIHy3X2CWYs38xk8BzpSLyo
 52NsgQ77q31t8sxbSnK9EQfVfFyA8JXvffodzaE4YNKrRjzWj5Ogzg9eiMdMmnBqIyiY
 MHUiI9+uluzNFjor3ZA8NppSRMdzLZi7SLlPMGWsreZHRSXHbAlin4I944mUlCnOJ2tP
 0Sow==
X-Forwarded-Encrypted: i=1;
 AKwUvBxQf0TouI5EH6qziqQa2lVagoPWdSBLEdFIshHO7+LvqkpSNsySPMxYBDuJaP+5Rmeh7dvesTDVOcjC@nongnu.org
X-Gm-Message-State: APuU4Z/nh7TerypmPPrdg7Cm1jJpMrXd/PCFgERE9e1szJf1Sm/1iojR
 6d/qS5+ppaLRj6JjwQg76hkOQzFYS/K9Mm+aT7Lec4VG7RvmOxgZkYaPdCpwgPaqZmsPj1erB74
 sX7L9vm6lkNGJxG2teL8Kx52IuS1JXeMPNYXsf9Fi
X-Gm-Gg: AYBFou340uG0HPXdS+jf4gyL8NHt8ygPBsUkfBDaizC6V1mx4s4ZCFUj0PwZaA2qFpA
 mMRlN5TaS3i/vGmh7A4JrtGdUeDok10E22/3anULai9QtTutVmnfDo8wHcZvOHK7c6rVVQcJScc
 1k5ccm3oGxIRv19IAVlATDSmnUpoAw8DBsnJ76mJ87Z/1TxTn1LWWsHemMXbnURulLbzZQSRN2T
 Qkb7207czBdvJjSmTdR5dBxwJpdVADsCdtErdyS9HwBA56fMUUiOCD728chCJB3/Yw0wavgfSuu
 T4B+H2OrAdGs41TP3/Mdib3HX+QfvfuhcRyF69m0eLhxSapLJxlSgQbesYTGbwN4hjLMH8yE+QM
 hQfZpJE7kq5PNUO3iFlIuGShFDXrfRj+tlrfLkbPH/IOLCETpBpIO8J1vHVQjYq+IKA==
X-Received: by 2002:a05:622a:261b:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-54f5ddb53e0mr4482831cf.6.1793991131920; Fri, 06 Nov 2026
 10:52:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-3-philmd@oss.qualcomm.com>
 <87jymr6zc6.fsf@draig.linaro.org>
In-Reply-To: <87jymr6zc6.fsf@draig.linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Fri, 6 Nov 2026 10:52:00 -0800
X-Gm-Features: AclHuK9q5wox1xphTwrGgk65icFPF_MBSNTosjysXinwBG92Os4SIC9Mc8Q-vv8
Message-ID: <CAGcCb122Ye_in-uZkXNgf6_qfiRCac1+eDspYY5JnnVvM6DfDA@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] tests/qtest/npcm7xx: Replace deprecated
 sprintf() with g_strdup_printf()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000275e5c065fa01cd1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wuhaotsh@google.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Nov 2026 15:01:39 -0500
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
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000275e5c065fa01cd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:02=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:
>
> > Replace sprintf() by safer g_strdup_printf() to fill the QOM path
> > and property names. This silences when using Apple clang 17.0.0:
> >
> >   ../tests/qtest/npcm7xx_adc-test.c:140:5: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >   ../tests/qtest/npcm7xx_adc-test.c:322:9: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >   ../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >   ../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >   ../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >   ../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: 'sprintf' is
> deprecated [-Wdeprecated-declarations]
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000275e5c065fa01cd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 5, =
2026 at 8:02=E2=80=AFAM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@oss.qualcomm.com" target=3D"_blank">philmd@oss.qualcomm.c=
om</a>&gt; writes:<br>
<br>
&gt; Replace sprintf() by safer g_strdup_printf() to fill the QOM path<br>
&gt; and property names. This silences when using Apple clang 17.0.0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_adc-test.c:140:5: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_adc-test.c:322:9: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;=C2=A0 =C2=A0../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: &#39;spr=
intf&#39; is deprecated [-Wdeprecated-declarations]<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@oss.qualcomm.com" target=3D"_blank">philmd@oss.qualcomm.com</a>&gt;<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br></blockquote><div>Revi=
ewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.=
com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div></div>

--000000000000275e5c065fa01cd1--

