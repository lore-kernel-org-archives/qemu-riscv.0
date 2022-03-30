Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZVAU-0002Au-AC
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 06:03:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1nZVAP-00027e-PF
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 06:03:06 -0400
Received: from [2607:f8b0:4864:20::631] (port=38767
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1nZVAN-00068w-JL
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 06:03:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so20015059plg.5
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=b+HtnPvjlRrlTz+K/8QS4BxARKqnH5WwyXPhQSKyC+w=;
 b=NavYJ4WebJhWaMe7IO/F2SKuSJDaOtUgD4LWPflyPVw4AiU2vxyrRF7gghcEggAGHB
 mEO+0AIWcafuYk2xU8LTRUzZJavHC7VGwA1u3tqnOwONDtC1Nc0wVkmTbnPslLDZo9wK
 VpWEfIvxkMi4WcwWr6lTkvzurKnerG1TupLGDd8pwwDrM9NIhZIq0+MNFu4jUe06ZDjM
 1WSMct+ONxnSDxkiV/3mIy84yAeWkl7ddHbXT8lwm9sR/od0Mn6b7v+colq+wtP8xbba
 bEvx63lbXbX+fWu+0lLMBOCh2jiHAz3nu8o4szaJAODzbwrSVYE6Ai36fBiFBJVmY2q0
 vbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=b+HtnPvjlRrlTz+K/8QS4BxARKqnH5WwyXPhQSKyC+w=;
 b=5XUGJ6R2lVi5rvn82022Wg7n53AUgzskJ/usN9fv9GGvhIs/Bp8lHWJzUgMFRJZPJM
 q5N6UeexQ6A1dbuAqT0VgQf/NCxD7KmMbF8VzBnyLO0gZ9uwPh3BAHD8sNho70jikTvL
 tKcIDGXdOiuo+yLm6gKXbslx4yOJaLQZhUnp+KVBKf0zMH9p4ENAJZ/GDZpQRbwkk0iB
 Lk1uF5xD+Vv3cqtop+O0Vi7A0SUKWGGeKrz0HXVAaZEHcmQPl/i30VqrNFDZm5moitUo
 oevhuWgtXwkxzlmgiHq46OYwYpkXihW7rI9n79MzJ+KMwJ5Vn5DYXH8eihhdFE6AigJt
 Lv4Q==
X-Gm-Message-State: AOAM530C94wJd2/uxqM0EHAZ/sMG10UsVVhNZCKvkP6apS6uFP3aK0sN
 MrBVbDlKmaElfMRWXa3bKj3B2A==
X-Google-Smtp-Source: ABdhPJz2HUHKe0usyt2K4/jj9J/RWI5bCBoQJr7avDsn15Q0ZCdMrxFPgkKmL2n2FOfQSEMlheq1Dw==
X-Received: by 2002:a17:903:32ce:b0:154:4a39:294d with SMTP id
 i14-20020a17090332ce00b001544a39294dmr34248648plr.48.1648634580894; 
 Wed, 30 Mar 2022 03:03:00 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e289-e64b-5086-f43b-5323-ad33.emome-ip6.hinet.net.
 [2001:b400:e289:e64b:5086:f43b:5323:ad33])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm23363871pfx.81.2022.03.30.03.02.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:03:00 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_B10A4A95-E765-4327-A9AC-1803D1CB3C74"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu v5 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
Date: Wed, 30 Mar 2022 18:02:57 +0800
References: <164845204233.25323.14607469451359734000-5@git.sr.ht>
 <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
 <BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com>
 <5ce85a5a-8309-9016-b88f-69af545e4114@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <5ce85a5a-8309-9016-b88f-69af545e4114@iscas.ac.cn>
Message-Id: <91927009-7EA2-461A-ACD0-F3B8955BA982@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=eop.chen@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 10:03:07 -0000


--Apple-Mail=_B10A4A95-E765-4327-A9AC-1803D1CB3C74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B43=E6=9C=8830=E6=97=
=A5 =E4=B8=8B=E5=8D=884:27 =E5=AF=AB=E9=81=93=EF=BC=9A
> =E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=883:42, =E9=99=B3=E7=B4=84=E5=BB=B7 =
=E5=86=99=E9=81=93:
>>=20
>>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> =E6=96=BC=
 2022=E5=B9=B43=E6=9C=8828=E6=97=A5 =E4=B8=8B=E5=8D=887:56 =E5=AF=AB=E9=81=
=93=EF=BC=9A
>>>=20
>>>=20
>>> =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =E5=86=99=E9=81=93:
>>>> From: eopXD <eop.chen@sifive.com <mailto:eop.chen@sifive.com>>
> Another question: max_elems is equal to total_elems when lmul >=3D 0.
>=20
> So max_elems can be reused  here instead of caculating total_elems =
again.
>=20
>>=20
>> I don=E2=80=99t understand your second question though. If nf =3D 3, =
there will be 3 registers
>> involved with the instruction (namely reg, reg+1, reg+2). Why do we =
care about
>> (reg+3)?
>>=20
> I just consider register group here. Reg, reg+1, reg+2 and reg+3 may =
belong to the same register group.
>=20
> Regards,
>=20
> Weiwei Li
>=20

According to v-spec (under section 7.8):

Each field will be held in successively numbered vector register groups. =
When EMUL>1
 each field will occupy a vector register group held in multiple =
successively numbered
vector registers, and the vector register group for each field must =
follow the usual vector
register alignment constraints (e.g., when EMUL=3D2 and NFIELDS=3D4, =
each field=E2=80=99s vector
register group must start at an even vector register, but does not have =
to start at a multiple
of 8 vector register number).

I think the spec has explained itself that NFIELDS represents the number =
of register groups involved
in this instruction. Therefore in a register group of 4 (LMUL =3D m2), =
NFIELD should be no more than 2.
The `vlmax` here would be (VLEN * 4 / EEW). In this sense, if the `vl` =
provided for the vector instruction
is within the range 2 * vlmax / 4 <=3D vl <=3D 3 * vlmax / 4, the =
elements in the 4th register (namely reg+3)
will all be counted as tail elements.

I hope this answers your question.

Regards,

eop Chen



--Apple-Mail=_B10A4A95-E765-4327-A9AC-1803D1CB3C74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div class=3D"">

</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" =
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=883=
0=E6=97=A5 =E4=B8=8B=E5=8D=884:27 =E5=AF=AB=E9=81=93=EF=BC=9A</div><div =
class=3D""><div class=3D"">
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=883=
:42, =E9=99=B3=E7=B4=84=E5=BB=B7 =E5=86=99=E9=81=93:<br class=3D"">
    </div>
    <blockquote type=3D"cite" =
cite=3D"mid:BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com" class=3D"">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
      <div class=3D""><br class=3D"">
        <blockquote type=3D"cite" class=3D"">
          <div class=3D"">Weiwei Li &lt;<a =
href=3D"mailto:liweiwei@iscas.ac.cn" class=3D"" =
moz-do-not-send=3D"true">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC
            2022=E5=B9=B43=E6=9C=8828=E6=97=A5 =E4=B8=8B=E5=8D=887:56 =
=E5=AF=AB=E9=81=93=EF=BC=9A</div>
          <br class=3D"Apple-interchange-newline">
          <div class=3D"">
            <div class=3D""><br class=3D"">
              =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=883:10, ~eopxd =
=E5=86=99=E9=81=93:<br class=3D"">
              <blockquote type=3D"cite" class=3D"">From: eopXD &lt;<a =
href=3D"mailto:eop.chen@sifive.com" class=3D"" =
moz-do-not-send=3D"true">eop.chen@sifive.com</a>&gt;<br =
class=3D""></blockquote></div></div></blockquote></div></blockquote><p =
class=3D"">Another question: max_elems is equal to total_elems when lmul
      &gt;=3D 0.</p><p class=3D"">So max_elems can be reused&nbsp; here =
instead of caculating
      total_elems again.<br class=3D"">
    </p>
    <blockquote type=3D"cite" =
cite=3D"mid:BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com" class=3D"">
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">I don=E2=80=99t understand your second question =
though. If
        nf =3D 3, there will be 3 registers</div>
      <div class=3D"">involved with the instruction (namely reg, reg+1,
        reg+2). Why do we care about</div>
      <div class=3D"">(reg+3)?</div>
      <div class=3D""><br class=3D"">
      </div>
    </blockquote><p class=3D"">I just consider register group here. Reg, =
reg+1, reg+2 and reg+3
      may belong to the same register group.</p><p =
class=3D"">Regards,</p><p class=3D"">Weiwei Li<br class=3D"">
    </p>
    </div></div></blockquote></div><br class=3D""><div =
class=3D"">According to v-spec (under section 7.8):</div><div =
class=3D""><br class=3D""></div><blockquote style=3D"margin: 0 0 0 40px; =
border: none; padding: 0px;" class=3D""><div class=3D""><span =
style=3D"color: rgb(36, 41, 47); font-variant-ligatures: normal; =
orphans: 2; widows: 2; text-decoration-thickness: initial; =
background-color: rgba(255, 255, 255, 0); font-size: 14px;" =
class=3D""><font face=3D"Times" class=3D"">Each field will be held in =
successively numbered vector register groups. When =
EMUL&gt;1</font></span></div><div class=3D""><span style=3D"color: =
rgb(36, 41, 47); font-variant-ligatures: normal; orphans: 2; widows: 2; =
text-decoration-thickness: initial; background-color: rgba(255, 255, =
255, 0); font-size: 14px;" class=3D""><font face=3D"Times" =
class=3D"">&nbsp;each field will occupy a vector register group held in =
multiple successively numbered</font></span></div><div class=3D""><span =
style=3D"color: rgb(36, 41, 47); font-variant-ligatures: normal; =
orphans: 2; widows: 2; text-decoration-thickness: initial; =
background-color: rgba(255, 255, 255, 0); font-size: 14px;" =
class=3D""><font face=3D"Times" class=3D"">vector registers, and the =
vector register group for each field must follow the usual =
vector</font></span></div><div class=3D""><span style=3D"color: rgb(36, =
41, 47); font-variant-ligatures: normal; orphans: 2; widows: 2; =
text-decoration-thickness: initial; background-color: rgba(255, 255, =
255, 0); font-size: 14px;" class=3D""><font face=3D"Times" =
class=3D"">register alignment constraints (e.g., when EMUL=3D2 and =
NFIELDS=3D4, each field=E2=80=99s vector</font></span></div><div =
class=3D""><span style=3D"color: rgb(36, 41, 47); =
font-variant-ligatures: normal; orphans: 2; widows: 2; =
text-decoration-thickness: initial; background-color: rgba(255, 255, =
255, 0); font-size: 14px;" class=3D""><font face=3D"Times" =
class=3D"">register group must start at an even vector register, but =
does not have to start at a multiple</font></span></div><div =
class=3D""><span style=3D"color: rgb(36, 41, 47); =
font-variant-ligatures: normal; orphans: 2; widows: 2; =
text-decoration-thickness: initial; background-color: rgba(255, 255, =
255, 0); font-size: 14px;" class=3D""><font face=3D"Times" class=3D"">of =
8 vector register number).</font></span></div></blockquote><div =
class=3D""><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">I think the spec has explained =
itself that NFIELDS represents the number of register groups =
involved</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">in this instruction. Therefore in a register group of 4 =
(LMUL =3D m2), NFIELD should be no more than 2.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">The =
`vlmax` here would be (VLEN * 4 / EEW). In this sense, if the `vl` =
provided for the vector instruction</div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">is within the range 2 * =
vlmax / 4 &lt;=3D vl &lt;=3D 3 * vlmax / 4, the elements in the 4th =
register (namely reg+3)</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">will all be counted as tail =
elements.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div></div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">I hope this answers your =
question.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">Regards,</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">eop Chen</div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><br class=3D""></div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_B10A4A95-E765-4327-A9AC-1803D1CB3C74--

