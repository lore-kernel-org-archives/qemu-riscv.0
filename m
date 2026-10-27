Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E7606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 05:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=KTdOUb9p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLZmO-00014r-TQ; Tue, 27 Oct 2026 01:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLZmM-00014h-Pp
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 01:31:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLZmL-0003kz-9H
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 01:31:22 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c445c95d553so486297766b.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 22:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793079079; x=1793683879; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0B4m15N5kcWjbnKFHohmSUTKb71f17BsTuaazBulgs8=;
 b=KTdOUb9pS0jDyRw8bgBaFe32xvFXViz/C/IzlBy0SxBZH+p/VnSTizFu95RRYesMDO
 ykGPLqBQg+uPjt/QfymLHgAonbVUQ4Kvb9YO5lIIp9Yrn7i/ZWmQ70qYSgnvXx6pUT+K
 +r+kZXOzwdkiZpIVaEY6i8T8zO+FwN4GbbWJrbMlLu4eM4gAf9kd2onYGT+CmFRcnT9u
 a5G8ts7MAx9C5pIZ5/OXBmuXnb7q6d8WwoljZpDGkQcNU03lBgVeLWlgHIeMsdR4ER2E
 AoojvVeaoDMyHvE5In+eZRDB0c598iX2QM74fDRzlDEgu3jRfqObRsuKVzzgnX8I9a4n
 m2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793079079; x=1793683879;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0B4m15N5kcWjbnKFHohmSUTKb71f17BsTuaazBulgs8=;
 b=zkPTnu8rQZi0fMt01UhV7ac5PJGqd0UmAu6wGwyw1stHBQ4ww/JLbZet59TfByrw7L
 x/I8BM6YwtDVmMWV2l1fetAbAist9yqqFgO/aha5TztELPzIiRHTYqnkZ0yv7xcCLjzb
 x8MyhjbzB5Llb91lkOj0N63aikhKu5yFLkVn2hi7LIZtoEnjF1cH7H7SM4BlnvOhF+zB
 0LEuNnYHoQhklsUSZbynqE43/TUI1H9HJY7HcbFL05UzxdxwTqZb57q1HXIp5/isl2B6
 jAuOCP7ZjfljBOOGQuarR511ZBTpC+9LO6eGGIcl40LhrrHT5We4u60ida8pwPj0p3cs
 JKKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLq8NLZp6e54hwPwIjvKtpzfvqp9AJUFdu0AlIR8cGD3Tgsqdq6lUkmuA0VgrnsBoFSxfuID+HUSkA@nongnu.org
X-Gm-Message-State: AFq9FYLBp18FwfPzmeSIsVdtU5B8WmwXCB6bwdnr3E6PcdoDHWbzZJoW
 +a4zU39flIMM/Hgw2T5shKZXN18alCtRmsS6SOhZK3fYT4c6DhpsCcJ+rMhcudh3qlGw00VXqUM
 t4eW1S4NCz1XburlGiHh2guzI9sxPOBSTxOQPIHZYCYVMyhqb8pfQNFCL7r8YrKqgqMQBYaqeKF
 TcCUMHTYDnQN0/Zbopmf4nTun35OAjqpThAjxLSeSItmk=
X-Gm-Gg: AYBFou0Sv309I7TkErZKg/p7/R/RmD+88lM+4eIwz5BZlkYsX+Jg60K8z/kVj4KtEOu
 HYQor31g2XH7Z9jsXAdEzlGtupBAyIZV49Sz3h5s4+xL98lBUA5JDAlYFA01nnnk2NhbQ+7n9Ec
 LhwaKDIi4BrJDMxSem3rXLg1Q56l3HYGe7RITmgfGnU/e7p9Ssb/yK80o1pD/5WDlN7IxHDGoMU
 v8SCN2sybBNhJBhEjSKH++Bqim3QNCY/kzyC7bYIDUUWdiXS++PMeCFOAg8HCgGyl8sqkNibIpC
 4SijwNt4LQhSPXMOOAKYO+JIcdUxhAtk/1wH1cuX7tdnmrIO8dAgr625c2XPq+78e2uS81gV53F
 r7LKEBCWlSMpXYsFl2E9Kj0Vgfw3qfEtq/hYl/RQDqHKjBkModLNtfTEFbb6RJomY/gQhBAen9w
 fq59zgrlP9O97DGobYZriyvyVkZSS71y7lU82fQqytA9H+qa+s+mGtbGqckoUq6YmbJOkGjOmT4
 uP+pFlZcrBrpWu0agzGKMox3L8alnRwd4m9RGMw2E4pqJL6At8vhXzWS00lY3qtD1y9ruCRqKPA
 YCoq8ygEVN0Z0t+yOA==
X-Received: by 2002:a17:907:9446:b0:c2d:d019:d414 with SMTP id
 a640c23a62f3a-c46bde099f5mr932981566b.29.1793079077775; 
 Mon, 26 Oct 2026 22:31:17 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49a4da0357sm81916366b.66.2026.10.26.22.31.14
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 22:31:15 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so5028898a12.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 22:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBx2S7/lTQFVed1ThtBvEuWJklYX/oaskedqHBWaKAglONi+FUUvumCUVvjjSPmYHnJbv8C08/NlXruw@nongnu.org
X-Received: by 2002:aa7:df94:0:b0:6ac:5c83:bb9f with SMTP id
 4fb4d7f45d1cf-6b442fe167dmr6891648a12.9.1793079073603; Mon, 26 Oct 2026
 22:31:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-3-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 27 Oct 2026 13:31:02 +0800
X-Gmail-Original-Message-ID: <CAMXXpfY0SQiqBBxhbnxV0sDyK40WwFwFGvB_dcbdxBZJxo7DxA@mail.gmail.com>
X-Gm-Features: AclHuK91An0Ffpvw_tIMTmx-6643buJ5x8CzuVAD66nWAFCkOlA4-J0m5S7g2m8
Message-ID: <CAMXXpfY0SQiqBBxhbnxV0sDyK40WwFwFGvB_dcbdxBZJxo7DxA@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] hw/riscv: Trace RAM Sink initial impl
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000003c879b065ecbc17a"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000003c879b065ecbc17a
Content-Type: text/plain; charset="UTF-8"

> +static uint64_t tr_ramsink_msgread(void *opaque, hwaddr addr, unsigned
> size)
> +{
> +    TraceRamSink *tram = TRACE_RAM_SINK(opaque);
> +
> +    switch (size) {
> +    case 1:
> +        return tram->msgs[addr];
> +    case 2:
> +        return (uint16_t)tram->msgs[addr];
> +    case 4:
> +        return (uint32_t)tram->msgs[addr];
> +    default:
> +        g_assert_not_reached();
> +    }
>


Could we use little-endian load helpers for the multi-byte accesses? As
written, both cases only read tram->msgs[addr]; the casts do not load the
following bytes. For example:

case 2:
    return lduw_le_p(&tram->msgs[addr]);
case 4:
    return ldl_le_p(&tram->msgs[addr]);

Thanks
Jay Chang

--0000000000003c879b065ecbc17a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">+static uint64_t tr_ramsink_m=
sgread(void *opaque, hwaddr addr, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 TraceRamSink *tram =3D TRACE_RAM_SINK(opaque);<br>
+<br>
+=C2=A0 =C2=A0 switch (size) {<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tram-&gt;msgs[addr];<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint16_t)tram-&gt;msgs[addr];<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint32_t)tram-&gt;msgs[addr];<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><span style=3D"background-color:trans=
parent">=C2=A0</span></div><div><p class=3D"gmail-wnfdnt10 gmail-_1ibi0s3fd=
 gmail-_1ibi0s3ce gmail-_1ibi0s3eg" dir=3D"auto">Could we use little-endian=
 load helpers for the multi-byte accesses? As written, both cases only read=
 <code>tram-&gt;msgs[addr]</code>; the casts do not load the following byte=
s. For example:</p><pre class=3D"gmail-_1ibi0s3d4" dir=3D"auto"><code class=
=3D"gmail-language-c">case 2:
    return lduw_le_p(&amp;tram-&gt;msgs[addr]);
case 4:
    return ldl_le_p(&amp;tram-&gt;msgs[addr]);<br><br>Thanks<br>Jay Chang</=
code></pre></div></div>
</div>

--0000000000003c879b065ecbc17a--

