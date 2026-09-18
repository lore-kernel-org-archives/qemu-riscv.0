Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4111AC982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:47:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Mkb-00079I-0p; Thu, 17 Sep 2026 20:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MkZ-000752-Ef
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:46:47 -0400
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MkX-0002Sa-Mu
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:46:47 -0400
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c294af0caa8so26751566b.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789692403; cv=none;
 d=google.com; s=arc-20260327;
 b=ZQMyD7yvyTc5sO7grKsnLiPcQyVTowTbeyek2sc4b14J2vateT93Gdgm0rInAvnMmt
 wsD/5dT3lbNGXrxmLMxtztcKuAyYIeETKw84rB5xh7USfClpTSsCquIVROPJb4pHbbmu
 QxJHZ9Q4v1hbo5ABi24VLxXYVgHap2Ooo1fid6GP5SdNM/9y50/oAzkWr3K3eUT8nCJT
 9ASjP+X95jQLiqtqRl0xpHNwJfRTKid3tqrivbUO+4ZXDCWWwsuyDO5TJYm1ERLpKA1c
 55bSed21l/1s+bbM/aWWjLjMWB6peOe1GzA+z7XGmi4vJ/K7PElvPz2SwOeK7teNyRh5
 1PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wo2dRSj5s2sDzZX3oIY5xn/mBZ82RAL94GNRiW1+pwk=;
 fh=Xt3AEo5pm6qDIByPbg815IKPshM61Akl5ijzMvDeQlk=;
 b=SDv6Jaw3ZMVnki4HSuSVVpoBC8EJkQS84eOqRWXFl/7+UGthE9lhJfenTFwA3fOmK5
 hTV+y4PmBymVXF4dP/HQ4h6Mt0LiPqnLXuvWEzKhVopm5TJP1+aL630MvaZCpQPhvfRm
 0FpfdiJuA4Ldta3M0WEH5qwanNwtSBEI1/Q3gQJZE2svBd+SZ8Mzptac8FNebu9x0xwo
 QK8vUFH8v4dCcFLUGhNEPmoGjz/X856WOpw95XhhjsHE9GFV1E3ejCc8nhqcWPBoGC5I
 f+uxPKi5475iNrqINCVT2oy+Xp9duripru0VCkSyeEOsU87FeO/wcTlEXQ8T+ebnK8ey
 FphA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692403; x=1790297203; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wo2dRSj5s2sDzZX3oIY5xn/mBZ82RAL94GNRiW1+pwk=;
 b=R5ydsLgAmB+jmyDno6yPiZ5L6eAHtIHxAsIQ6nd3aVK3VK2ere5SOW2xfq8jKxf6c5
 E3SggP6KB82MlRevPcX4YtLuWWonw15nghCLQC8sZI6kxnKyAfN3gCjvJMbRQS4JAgNX
 j9+X2Etxtwi09oDaNLig4JUtZ/c/nwEKk4W3O5RZc9kmsP4FTiYmMj6+ncBdkZhYcXpF
 DrsqOohin5wU6X0X2hTyMQCQurgghDef9aFmQKyykrm5HPQWYoL4mEa+hpUel0FCPUAV
 6lGtFd5i7pXxOQLM0cndWJm4jqaHA+eu1gXq8nkpuYKG2no3HrNjrFunWA+iCVjxjwTl
 EsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692403; x=1790297203;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wo2dRSj5s2sDzZX3oIY5xn/mBZ82RAL94GNRiW1+pwk=;
 b=Dtk6sFi09qnbr5qM2dB2IC2a1pVPG8O9t/hBTBrw3YDS3ICmFb1jj3+Qmn/lHv43f6
 DCfPlBT4Ccc14016CdrxOrwnER0o36Qaf8z28nVaLLPxiD656dx7yUAou6D0ZtnsZ2sl
 Sr3N316X+alqRnHy480w8Z7m/ZiFUP+QaMfdbi+Qvr10UiYJ5H2pgfG3VbNIYwgYR6ol
 9t9FsVu4cFYuy9cWjbPp5NhK1Fl1xzyvBJgUbjaRseZvtwl9HCeUKj0nQAsrCqzvSz/D
 rvY6w0G14ZP6dpXPvlagRa/qMY0KUUnx9SeueZPCUjAfh5ofviFfq+dXroFX99CK+2U8
 c98A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNC1suTDgYWGPNBigkP7lnkQ/maccXT09g1YnlRu5pKIsjSrwiQH+RbzxfVCKgzpLt49WBusfC8gwR@nongnu.org
X-Gm-Message-State: AFuF++mgc3swdCovESKmBmZv6u6y5z9VO+W2FMRJ9rD72l5xSFaHZfFe
 nJUEMBV2vKEFpkB6ZreEd+TD8Opr+x8Zx1qCPJZym7IVJm4gIAN3wUFRAQZcuFk0quaDbUGcjv5
 nXLk7RBNXGhRB/0LPnNZBoIx3XrSpvMs=
X-Gm-Gg: AYBFou2ZuqIvPBy3z0+tpJnkMw/+5GcME7jRftyozugHSFC4dm+ulWgnsAdLnvzbuRr
 vxaye7LAhyV2mkOk4AlGfedz/l18sUQ/1lQ4G7+CUnHnqJxoyZ3kwxi5RhOHF0SPKlVNSzgk27U
 5c5nsWUc7TGw+EXC2rMZ4s6SL9/L2za+HZZQoPqODR9VR01KzGCGt2L0wPOkh3vfgZzzy71c1S+
 Ch+fUJitmUUZRXToJtHoZtCJyWmw7zlh6rzTFdaVtukj5vyTOvzhFTqxaVgESFODzIZ6hnLUJ7K
 BzOjmouXk/uGqO3Y0oJ8N3u0k1/ue4BQ4S2K9Js++1d3FAUm2VGQ9po=
X-Received: by 2002:a17:907:3f1e:b0:c29:5340:1837 with SMTP id
 a640c23a62f3a-c2a156d703cmr89272366b.16.1789692403256; Thu, 17 Sep 2026
 17:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-10-babc367b60f5@rev.ng>
 <f692f936-550b-4e5b-90ee-399edf21de73@oss.qualcomm.com>
 <CAE2XoE9KkW+WPWL1g4hzT6OtkQhfYvaMAopBW4NfFMkXn9hjzQ@mail.gmail.com>
 <ef62c7fc-9db5-43f2-adbc-e86a805757b4@oss.qualcomm.com>
 <686611d2-d6ca-4022-adbd-49cb7b0b943a@oss.qualcomm.com>
In-Reply-To: <686611d2-d6ca-4022-adbd-49cb7b0b943a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 18 Sep 2026 08:46:29 +0800
X-Gm-Features: AcwNN1UsY21CNqDUgQt07opHhdSRSGJtkOky72ouFDFT_bknCveTS_ROtVVk0nU
Message-ID: <CAE2XoE-Nn9rj8Ejc-dsHoY3KRUb5kRPhQSOfxx8MpMMdmhmXUg@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] target-info: Introduce target_riscv32
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, philmd@oss.qualcomm.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com
Content-Type: multipart/alternative; boundary="000000000000f4120f065bb73bbe"
Received-SPF: pass client-ip=2a00:1450:4864:34::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000f4120f065bb73bbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:11=E2=80=AFAM Pierrick Bouvier <
pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 9/17/2026 10:05 AM, Pierrick Bouvier wrote:
> > On 9/16/2026 6:00 PM, Yonggang Luo wrote:
> >> As I said before, we need the `const TargetInfo*` parameter to for
> >> is_avaiable.  I've get all accelerator and i386/x86_64/aarch64/arm/
> >> risv32/riscv64/
> >>
> >
> > In general, on QEMU dev, we can't block other series to do a change
> > compatible with a current work in progress. In other words, the first
> > merged wins, and the second has to solve the conflicts. That's sometime=
s
> > frustrating, and having worked on single-binary for more than a year,
> > yes I confirm it's not always fun to "cleanup" behind people patches.
> > That's part of the work though.
> >
>
> I should say "request changes" instead of "block", because I know you're
> kindly asking for it.

Yeap, I'll wait for this merged first. thanks.


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000f4120f065bb73bbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Sep 18, 2026 at 1:11=E2=80=AFAM Pierrick B=
ouvier &lt;<a href=3D"mailto:pierrick.bouvier@oss.qualcomm.com">pierrick.bo=
uvier@oss.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 9/17/2026 10:05 AM=
, Pierrick Bouvier wrote:<br>&gt; &gt; On 9/16/2026 6:00 PM, Yonggang Luo w=
rote:<br>&gt; &gt;&gt; As I said before, we need the `const TargetInfo*` pa=
rameter to for<br>&gt; &gt;&gt; is_avaiable.=C2=A0 I&#39;ve get all acceler=
ator and i386/x86_64/aarch64/arm/<br>&gt; &gt;&gt; risv32/riscv64/<br>&gt; =
&gt;&gt;<br>&gt; &gt;<br>&gt; &gt; In general, on QEMU dev, we can&#39;t bl=
ock other series to do a change<br>&gt; &gt; compatible with a current work=
 in progress. In other words, the first<br>&gt; &gt; merged wins, and the s=
econd has to solve the conflicts. That&#39;s sometimes<br>&gt; &gt; frustra=
ting, and having worked on single-binary for more than a year,<br>&gt; &gt;=
 yes I confirm it&#39;s not always fun to &quot;cleanup&quot; behind people=
 patches.<br>&gt; &gt; That&#39;s part of the work though.<br>&gt; &gt;<br>=
&gt;<br>&gt; I should say &quot;request changes&quot; instead of &quot;bloc=
k&quot;, because I know you&#39;re<br>&gt; kindly asking for it.<br><br>Yea=
p, I&#39;ll wait for this merged first. thanks.<br><br><br>--<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=
=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000f4120f065bb73bbe--

