Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njPno-0005EM-Kx
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 14:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njPnm-00055e-EW
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 14:20:42 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njPnk-0004ms-FE
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 14:20:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id i24so18695270pfa.7
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 11:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=K2/ubV9B9/zNePm6+dpGtioZnf3eEp8eU4rOx5tHqyA=;
 b=Y0vq7QNabPwfprhAQF3XoK51d0l5kCAmXqHumHXa5gJDDe4jCg2x+jbP3Uza5LMuXw
 5rJftFNYzHlIG0D+iMLocRX/j6WSyeS7EbYp/nPDtw+0d/+n7gwebi/M0UjeE1KoUVVP
 HsxDS4rxOT5TaPI8Vs6gibE4ojsQjxS+wjmsJWZButI7Oalr1Sp8d5JwJiljpSq24Mk0
 QPeUU6thiul0MXzpmNOLDfYFPV0hdySxk01mjjeM7Y44RyFO/5xmOa2NjzXHyWNuJiuD
 Okhs+oAOnkmXJc2jRpvw9UWBQRocFUhnoqbxpycMVCu/VOP7I0vNtK9VuxvDKaGlsA7k
 jfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=K2/ubV9B9/zNePm6+dpGtioZnf3eEp8eU4rOx5tHqyA=;
 b=QxdxMR/I+e19oB7f/A+VgdmnHVxBP58fcRZ4PI2bwfL6LLscalG8IjW/UuNuy4Y3Tb
 OAXkeLkfABwXX4rTQg9c3iO0ndI8zV4+/FuqcqBXH8Ojl3Z2W+xTYWK5WIF5dMZF3t1v
 liBGs66yUibY5QG5HuM5u4sNML0SFFG96dxMrHypONDC086KzW8byhSGCnXKuU+yNz4C
 5nM9vAiwpCGY74PYqVyWvkNkBwxlkNrXyk4RPJJo2TNcwX7C3ebN42v+/Q3sfo9KX9Xe
 e1xJSiJEjphibTuqwCOXoe1gb6eImhOnmlaHRTO4EpFtXP/FmslfyuBRkUe8a5WRlQOG
 Wzug==
X-Gm-Message-State: AOAM531fgBce63G7hMKnLjfdicI4KcIGtrwU/sdRBn9wxeYg76HwHf8o
 xBdWL/ahBzIAqmcT/eoHIQnYqQ==
X-Google-Smtp-Source: ABdhPJyTfaEIsi2l20jbGoBxGL1i4cOGILI2ySh00NjlinXzJdJnvdn/+PPyELeBxGCsPJpU5K2JUA==
X-Received: by 2002:a63:694a:0:b0:3aa:e962:db29 with SMTP id
 e71-20020a63694a000000b003aae962db29mr16038828pgc.421.1650997238687; 
 Tue, 26 Apr 2022 11:20:38 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e235-7644-45ae-f6b4-e625-f1e2.emome-ip6.hinet.net.
 [2001:b400:e235:7644:45ae:f6b4:e625:f1e2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020aa790d6000000b0050a765d5d48sm16068288pfk.160.2022.04.26.11.20.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:20:38 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_CDB23E21-F0AE-4A39-8768-3D95C18832CD"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
Date: Wed, 27 Apr 2022 02:20:35 +0800
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
 <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
Message-Id: <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=eop.chen@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Apr 2022 18:20:42 -0000


--Apple-Mail=_CDB23E21-F0AE-4A39-8768-3D95C18832CD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B44=E6=9C=8826=E6=97=
=A5 =E4=B8=8B=E5=8D=884:47 =E5=AF=AB=E9=81=93=EF=BC=9A
> =E5=9C=A8 2022/3/17 =E4=B8=8B=E5=8D=883:26, ~eopxd =E5=86=99=E9=81=93:
>> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>>=20
>> This is the first commit regarding the mask agnostic behavior.
>> Added option 'rvv_ma_all_1s' to enable the behavior, the option
>> is default to false.
>>=20
>> Signed-off-by: eop Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com> =
<mailto:frank.chang@sifive.com>
> Similar to our last discussion,  vext_set_elems_1s_fns array can be =
simplified to single vext_set_elems_1s,
>=20
> since the fourth argement can be used as the start offset.=20
>=20
> Another question, may be not related to this patchset, in section =
3.4.3 of the spec:=20
>=20
> "Mask destination tail elements are always treated as tail-agnostic, =
regardless of the setting of vta."
>=20
> What does "Mask destination tail elements" mean?
>=20
> Regards,
>=20
> Weiwei Li
>=20


I have just updated a new version for the tail agnostic patch set, it =
also includes a bug fix discovered today.

Regarding the question, mask / masked-off are for body elements and =
respects the mask policy, and tail elements respect the tail policy.

Regards,

eop Chen=

--Apple-Mail=_CDB23E21-F0AE-4A39-8768-3D95C18832CD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B44=E6=9C=882=
6=E6=97=A5 =E4=B8=8B=E5=8D=884:47 =E5=AF=AB=E9=81=93=EF=BC=9A</div><div =
class=3D""><div class=3D"">
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/3/17 =E4=B8=8B=E5=8D=883=
:26, ~eopxd =E5=86=99=E9=81=93:<br class=3D"">
    </div>
    <blockquote type=3D"cite" =
cite=3D"mid:165089631935.4839.7564289944057093570-1@git.sr.ht" class=3D"">=

      <pre class=3D"moz-quote-pre" wrap=3D"">From: Yueh-Ting (eop) Chen =
<a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the mask agnostic behavior.
Added option 'rvv_ma_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eop.chen@sifive.com">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:frank.chang@sifive.com">&lt;frank.chang@sifive.com&gt;</a>
</pre></blockquote><p class=3D"">Similar to our last discussion,&nbsp; =
vext_set_elems_1s_fns array can
      be simplified to single vext_set_elems_1s,<br class=3D"">
    </p><p class=3D"">since the fourth argement can be used as the start =
offset. <br class=3D"">
    </p><p class=3D"">Another question, may be not related to this =
patchset, in section
      3.4.3 of the spec: <br class=3D"">
    </p><p class=3D""><i class=3D"">"Mask destination tail elements are =
always treated as
        tail-agnostic, regardless of the setting of vta."</i></p><p =
class=3D"">What does "Mask destination tail elements" mean?</p><p =
class=3D"">Regards,</p><p class=3D"">Weiwei Li<br class=3D"">
    </p>
    </div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">I have just updated a new version for =
the tail agnostic patch set, it also includes a bug fix discovered =
today.</div><div class=3D""><br class=3D""></div><div class=3D"">Regarding=
 the question, mask / masked-off are for body elements and respects the =
mask policy, and tail elements respect the tail policy.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Regards,</div><div =
class=3D""><br class=3D""></div><div class=3D"">eop =
Chen</div></body></html>=

--Apple-Mail=_CDB23E21-F0AE-4A39-8768-3D95C18832CD--

