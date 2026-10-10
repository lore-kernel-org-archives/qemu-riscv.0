Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE2CA9EBE
	for <qemu-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 08:53:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFSpW-0004vD-4J; Sat, 10 Oct 2026 04:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFSpU-0004un-82
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 04:53:20 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFSpS-0002GV-PZ
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 04:53:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so441456166b.1
 for <qemu-riscv@nongnu.org>; Sat, 10 Oct 2026 01:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791622397; cv=none;
 d=google.com; s=arc-20260327;
 b=E9RfwjXr0jFJV0ojSABxsyurp2jR81aJ9lBXE39GPXu2b6N5HQqb+WT3TChGiC8ulu
 +6QUrXSLEWfhrxdkx5N06z+NdXCz+tZBIhTNAQllDnbkxw37+0B00N9CputV43RVqlKe
 locokiokynQ9PuHkefxvpddiGCScnkRzfHFVTwD3APUJciPhZMVSNmQLUBX2OnJ4ozvJ
 xbKzWYwZPZ//51Rin34Hg7JJ8gO2bYhVoEonB7+ztos+iB4pWw65Axd9e4sE9i3HrKM9
 jPYluE0EV72ez/cJuL6tBBSZFE4Efg8Tt8YSLGZVL/5rRY0oRQjIvQ3nGbEf499LFAG1
 n7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 fh=nHJv5y7Y8RPmtZ3MSBWBBpU+jeA1mjnv70Mhf5IqAWI=;
 b=nulmBuUpZsvft5zMbIf5qt9jHKq1hKpaxij1EHE/va6MqawbH1fTYmILEyrXZYDUC6
 4LiKrAdoGLUTwE+TDneMcWWrccYReYpdtCbc9pQ4L2p97JkM6eUX5OLnh4ZwrD83o0UX
 3L2SOIJJvqp36rWJKLSnlm8w/xnc/ryZSIwab82y0t2DekCTzVkPdgFjcAE2z4QiWlQD
 yS8LhdiIXkVz2gHVv+4tFmR99O9T3o8b8cyFhVwoHmjKKTzPkjugjsN/hQaBsv/vuEO0
 o+jdVpqACy5nwsMqHHryHI1U4adYQ1JtUI/BSjKqw2mgqcivbmA/qqqBxHrLt/mu538R
 bKhA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791622397; x=1792227197; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 b=UOmGmVjBGeJgrfppulbogZjjkCeL1qeOxflZbsHozNbznzfgOf87kJ3NmrEjHEPb4B
 nbzC447V2HtQlYWfLoRbd1Ykd8k0zwAEqYj38+19ZG2KtBQ8jWIvMlJBDz3rQITCLjuq
 EmtZ3MvHpXf7lUZnwx1igNOa6lYsCZyKmhUmeZ0QLZrm89cg4LyIS0I9WE9GnTdFiyKA
 nIcFUXG+bxp8se19f+GxeNmlkQcNYXF7+6oaxOulKgvm037ssCqhj9Mdb706SHCLBQXr
 bphQEWBYpWPcPetxy+rAXB0Xyua77c4gt7Aru5xxIl+n6UkjMXIzjmyhp5IKa94WP9iI
 LpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791622397; x=1792227197;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 b=FBio9ZRmAmixsUw/IOelJR5wBtWECLTHrKwTxpxwPxs+Sk6zuROwGvNK43h1CQCSY8
 FF9IA2M8LKOdTrJOApaaDN+a50ueAgQkdk5sPFFTtk53KgVD86weod9XFcx0jgpYwh9L
 ha+Y9/ZaHhlF0gAs/TRTrdftqCOx4ufxAW1Mqvej56U+YbLMFv5siqbUp86Y6fjXar9N
 8U2+YWiOUakHQSY4GarwIb9ve29cYRV9T3cniu/pidYz0C4Idi2gyBVXKU/+o0T6cvpR
 G42CBBohujHARqCuEXGPBU3DfWaUIeuuSfv7ypqFTbCYNhO036a9G7EBffp6dKZhto9L
 8hHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpXptmX/IA/nrTQE/Wc0nghfpbiOu/PbKDQa7u9qIINBbOyxP8KCRYQb/Jwcqy/dRHfV8r86fKf/mF@nongnu.org
X-Gm-Message-State: AFq9FYIXt520IUVa6xVqynywpFxMwkmfAX2jvq2R2ULYZW2YOB7oDqU9
 vzJnUMRp0i4HTUyRa8+tOOuooK/czJfCJDdDDDzbticHPlx3HR/RZSTdO40HqaqPvpa9n0IG7ZP
 nO7NovnQdgZosBlQHBzlreU4GHZb47gI=
X-Gm-Gg: AYBFou1AUXUyM/Ut3/r3KjCh+5mEATlNF9A9XIk2NHKo0CfdxGVeEjEGaD9lx+orRQs
 kQf7GnNt5Gwf8D+j/wCS7s/ndJa7nma5U23n/bwfYsUKPkfEDQeF1M5TyVjOrT+0FY+IbrWmZWF
 yeYH5WXL11aSeY08PtjM4lcriANcn2egGqOJntj+OXvY1DZNjCnamyy8eIczl36QOUwr6+a7VTA
 pFOqd1gSh+67l+LQNJO8W/cdCMDmiHGkb0/Mxr+aHFb8dQdq1KqFDr3pFk8Q804d3dy7EKTHDYK
 3SD1bbEapkbyASTox1g04kkLsZ5oBOZPOOonTfqpyi8+3LCTIPOSTnA=
X-Received: by 2002:a17:907:3f10:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c31a704c117mr486284466b.17.1791622396469; Sat, 10 Oct 2026
 01:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260930073935.712-1-luoyonggang@gmail.com>
 <20260930073935.712-5-luoyonggang@gmail.com>
 <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
 <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
In-Reply-To: <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 10 Oct 2026 16:53:03 +0800
X-Gm-Features: AclHuK-mGE5Tz1NdZxyasvNIzxWLi83QMEQdr3i_f1dXs3mg-q_5HqkgS36z4O8
Message-ID: <CAE2XoE97kuRkF4i2+t=tH0d0dXWjCaNmUjUaVZDPekWimSN3gw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] tcg: namespace target helper symbols for combined
 builds
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Song Gao <17746591750@163.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x62b.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 10, 2026 at 3:45=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/1/26 18:51, Pierrick Bouvier wrote:
> > On 9/30/2026 12:39 AM, Yonggang Luo wrote:
> >> Use target-specific assembler names and helper metadata for TCG helper=
s
> >> when multiple targets share a binary. The generated prototype maps the
> >> generic C helper name to a target-specific linker symbol, for example:
> >>
> >>      helper_raise_exception
> >>          __asm__("helper_i386_raise_exception")
> >>
> >> This lets target helper definitions keep generic C names while avoidin=
g
> >> linker symbol collisions between targets.
> >>
> > Hi Richard, do you have an opinion on this patch?
> >
> > We are trying to see if we do renaming per helper, or if we introduce a
> > "generic" way to deal with it. I don't have a strong opinion, renaming
> > things or adding more macros and build system soup are both ok on my
> > side, so direction would depend on your culinary taste.
> I think the general direction is good.  Perhaps the specifics need
> adjustment.  In particular, using __asm__ to rename symbols is suspect
> and likely non-portable to non-ELF hosts like Darwin and Windows.

I have already tested on windows, only not sure about Darwin, let's me
create a test on Darwin,
because I do not have a CI for Darwin to test it.

>
>
> r~



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

