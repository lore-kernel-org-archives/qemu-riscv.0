Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njX5M-0006T6-BB
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 22:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njX5K-0006Sl-U2
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 22:07:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njX5I-0002vq-VI
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 22:07:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so1828466pjb.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 19:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=uf9Lt07yRu0HqT81cRj6a9UI3MDF+dL/RCHfM04TutE=;
 b=VnrvqMqMIeOr2SX9XCd0dopjmjRCdUGZbeJONUVkkG4wLJ2kQ4lLgNZhnjQinZJLgu
 WwdS90Z6P+XpYMXe5ymYOJsUwehfezCdPObcE7agrEjninMA6XaODzWSMIomQ3xadVUW
 ajXOtbKxgLZ1YeLkMt8jC9oh1txQXFHsE6ZA9CPDgo7CxbFHFp4zWmaEiSssEduCWtUs
 2xKV/DHKGHUJImDrFjaN+G1U6FWTdt2U1vO7CiOJv1iBoXA/3eyxbktuliBFE2coVlac
 AGl29p96M1FzA3QnRJZ9qzykn/euVnch+i1wD/naqxzipGLnZ5+zaYbmzRoTQM77AxaF
 iP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=uf9Lt07yRu0HqT81cRj6a9UI3MDF+dL/RCHfM04TutE=;
 b=EAGCJam8VQUbLWsCBjQmHHbBafcrDKYKaOacL7Sg9DPgkgxYvO0QbFgol/OTmIX++C
 czNBIf1EK7VK+PkG9O4d2qFRfUWXC77B4X3g68lHThSfZ86C/YAdfCj4qbrBS6v/+xNC
 EoFSWSWJEbvOLYfFPtN3nAQ0BfH1BESdY0ifLEvBGBHP46ZfylyUJjrwL0QEfLAeMtWI
 ThQxszJAl9yqUBnuhoAkuRPtdUkeg+Xy1hFWFZxROVj1VzSBPgZJf539kvybhHa208wP
 MmpQm3Pyk8WG1LfkpStTqOo4lESeyvzZXTOidHiZZRqFa5+jIOv47vnRdjXlQRtCYEve
 ebdg==
X-Gm-Message-State: AOAM532AffTQ06NwP/0uPTqunr1X/er2aPa38gyqvGWWRqMdgF87eLFR
 QXUNLXovKPqx7LIU/TBTGBfioz5lOjeNRyNz
X-Google-Smtp-Source: ABdhPJwMw0fazCiC6K7UbMUUcrAKHxvuiW6glkW5W4FIieM/eVBmbHMHbgSPLEQT43wE09spyKs2iQ==
X-Received: by 2002:a17:90a:4a8a:b0:1d5:a3df:ab5 with SMTP id
 f10-20020a17090a4a8a00b001d5a3df0ab5mr35220599pjh.64.1651025235291; 
 Tue, 26 Apr 2022 19:07:15 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e235-7644-9cc6-88c6-245c-273d.emome-ip6.hinet.net.
 [2001:b400:e235:7644:9cc6:88c6:245c:273d])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004fae885424dsm17835457pfx.72.2022.04.26.19.07.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:07:14 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C248E793-63EE-4D32-8E68-1AB2FF102BEB"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
Date: Wed, 27 Apr 2022 10:07:09 +0800
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
 <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
 <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
 <c79a9d80-5723-8f17-9094-e8447d4d7b5a@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <c79a9d80-5723-8f17-9094-e8447d4d7b5a@iscas.ac.cn>
Message-Id: <C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=eop.chen@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 02:07:19 -0000


--Apple-Mail=_C248E793-63EE-4D32-8E68-1AB2FF102BEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



>=20
> =E5=9C=A8 2022/4/27 =E4=B8=8A=E5=8D=882:20, eop Chen =E5=86=99=E9=81=93:=

>>=20
>>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> =E6=96=BC=
 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 =E4=B8=8B=E5=8D=884:47 =E5=AF=AB=E9=81=
=93=EF=BC=9A
>>> =E5=9C=A8 2022/3/17 =E4=B8=8B=E5=8D=883:26, ~eopxd =E5=86=99=E9=81=93:=

>>>> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>>>>=20
>>>> This is the first commit regarding the mask agnostic behavior.
>>>> Added option 'rvv_ma_all_1s' to enable the behavior, the option
>>>> is default to false.
>>>>=20
>>>> Signed-off-by: eop Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>>>> Reviewed-by: Frank Chang <frank.chang@sifive.com> =
<mailto:frank.chang@sifive.com>
>>> Similar to our last discussion,  vext_set_elems_1s_fns array can be =
simplified to single vext_set_elems_1s,
>>>=20
>>> since the fourth argement can be used as the start offset.=20
>>>=20
>>> Another question, may be not related to this patchset, in section =
3.4.3 of the spec:=20
>>>=20
>>> "Mask destination tail elements are always treated as tail-agnostic, =
regardless of the setting of vta."
>>>=20
>>> What does "Mask destination tail elements" mean?
>>>=20
>>> Regards,
>>>=20
>>> Weiwei Li
>>>=20
>>=20
>>=20
>> I have just updated a new version for the tail agnostic patch set, it =
also includes a bug fix discovered today.
>>=20
>> Regarding the question, mask / masked-off are for body elements and =
respects the mask policy, and tail elements respect the tail policy.
>>=20
>> Regards,
>>=20
>> eop Chen
>=20
> I find another descriptions in the spec. For the instructions that =
write mask register (such as vmadc, vmseq,vmsne,vmfeq...), they all have =
similar description
>=20
> (You can search "tail-agnostic" in the spec):
>=20
> Section 11.4: "Because these instructions produce a mask value, they =
always operate with a tail-agnostic policy"
>=20
> Section 11.8/13.13: "Compares write mask registers, and so always =
operate under a tail-agnostic policy"
>=20
> Section 15.1: "Mask elements past vl, the tail elements, are always =
updated with a tail-agnostic policy"
>=20
> Section 15.4/15.5/15.6: "The tail elements in the destination mask =
register are updated under a tail-agnostic policy"
>=20
> So I think "Mask destination tail elements" may means the tail element =
for instructions that take mask register as destination register.  For =
these instructions,=20
>=20
> maybe the setting of VTA can be ignored. =20
>=20
> Regards,
>=20
> Weiwei Li
>=20

Yes, the setting of VTA should be ignored when v-spec specifies.
I think the implementation of the tail agnostic patch set don=E2=80=99t =
need to change on this.

Regards,

eop Chen




--Apple-Mail=_C248E793-63EE-4D32-8E68-1AB2FF102BEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div class=3D"">

</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br class=3D""></div><div class=3D""><div class=3D"">
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/4/27 =E4=B8=8A=E5=8D=882=
:20, eop Chen =E5=86=99=E9=81=93:<br class=3D"">
    </div>
    <blockquote type=3D"cite" =
cite=3D"mid:240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com" class=3D"">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
      <br class=3D"">
      <div class=3D"">
        <blockquote type=3D"cite" class=3D"">
          <div class=3D"">Weiwei Li &lt;<a =
href=3D"mailto:liweiwei@iscas.ac.cn" class=3D"" =
moz-do-not-send=3D"true">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC
            2022=E5=B9=B44=E6=9C=8826=E6=97=A5 =E4=B8=8B=E5=8D=884:47 =
=E5=AF=AB=E9=81=93=EF=BC=9A</div>
          <div class=3D"">
            <div class=3D"">
              <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/3/17 =
=E4=B8=8B=E5=8D=883:26, ~eopxd
                =E5=86=99=E9=81=93:<br class=3D"">
              </div>
              <blockquote type=3D"cite" =
cite=3D"mid:165089631935.4839.7564289944057093570-1@git.sr.ht" class=3D"">=

                <pre class=3D"moz-quote-pre" wrap=3D"">From: Yueh-Ting =
(eop) Chen <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eop.chen@sifive.com" =
moz-do-not-send=3D"true">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the mask agnostic behavior.
Added option 'rvv_ma_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eop.chen@sifive.com" =
moz-do-not-send=3D"true">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:frank.chang@sifive.com" =
moz-do-not-send=3D"true">&lt;frank.chang@sifive.com&gt;</a>
</pre>
              </blockquote><p class=3D"">Similar to our last =
discussion,&nbsp;
                vext_set_elems_1s_fns array can be simplified to single
                vext_set_elems_1s,<br class=3D"">
              </p><p class=3D"">since the fourth argement can be used as =
the
                start offset. <br class=3D"">
              </p><p class=3D"">Another question, may be not related to =
this
                patchset, in section 3.4.3 of the spec: <br class=3D"">
              </p><p class=3D""><i class=3D"">"Mask destination tail =
elements
                  are always treated as tail-agnostic, regardless of the
                  setting of vta."</i></p><p class=3D"">What does "Mask =
destination tail elements"
                mean?</p><p class=3D"">Regards,</p><p class=3D"">Weiwei =
Li<br class=3D"">
              </p>
            </div>
          </div>
        </blockquote>
      </div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">I have just updated a new version for the tail
        agnostic patch set, it also includes a bug fix discovered =
today.</div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">Regarding the question, mask / masked-off are for
        body elements and respects the mask policy, and tail elements
        respect the tail policy.</div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">Regards,</div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">eop Chen</div>
    </blockquote>
    <br class=3D""><p class=3D"">I find another descriptions in the =
spec. For the instructions
      that write mask register (such as vmadc, vmseq,vmsne,vmfeq...),
      they all have similar description</p><p class=3D"">(You can search =
"tail-agnostic" in the spec):</p><p class=3D""><i class=3D"">Section =
11.4: "Because these instructions produce a mask
        value, they always operate with a tail-agnostic policy"</i><i =
class=3D""><br class=3D"">
      </i></p><p class=3D""><i class=3D"">Section 11.8/13.13: "Compares =
</i><i class=3D"">write mask registers,
        and so always operate under a tail-agnostic policy"</i><i =
class=3D""><br class=3D"">
      </i></p><p class=3D""><i class=3D"">Section 15.1: "Mask elements =
past vl, the tail elements, are
        always updated with a tail-agnostic policy"</i><i class=3D""><br =
class=3D"">
      </i>
    </p>
    <i class=3D"">
    </i><p class=3D""><i class=3D"">Section 15.4/15.5/15.6: "The tail =
elements in the destination
        mask register are updated under a tail-agnostic policy"</i><br =
class=3D"">
    </p><p class=3D"">So I think "Mask destination tail elements" may =
means the tail
      element for instructions that take mask register as destination
      register.&nbsp; For these instructions, <br class=3D"">
    </p><p class=3D"">maybe the setting of VTA can be ignored.&nbsp; <br =
class=3D"">
    </p><p class=3D"">Regards,</p><p class=3D"">Weiwei Li<br class=3D"">
    </p>
  </div>

</div></blockquote></div><br class=3D""><div class=3D"">Yes, the setting =
of VTA should be ignored when v-spec specifies.</div><div class=3D"">I =
think the implementation of the tail agnostic patch set don=E2=80=99t =
need to change on this.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Regards,</div><div class=3D""><br class=3D""></div><div =
class=3D"">eop Chen</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_C248E793-63EE-4D32-8E68-1AB2FF102BEB--

