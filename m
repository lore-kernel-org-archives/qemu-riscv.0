Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWHvp-00017c-JU
	for mharc-qemu-riscv@gnu.org; Mon, 21 Mar 2022 09:18:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1nWCoe-0001za-PM
 for qemu-riscv@nongnu.org; Mon, 21 Mar 2022 03:51:01 -0400
Received: from [2607:f8b0:4864:20::1030] (port=44580
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1nWCoc-0007z3-Gk
 for qemu-riscv@nongnu.org; Mon, 21 Mar 2022 03:51:00 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so13676684pjp.3
 for <qemu-riscv@nongnu.org>; Mon, 21 Mar 2022 00:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:message-id:date:cc:to;
 bh=xw+UHeE/WlPnjS6igLkf6cJqO8zrJISeOqFOIYWeGw8=;
 b=ZqqGfpmMeaXcG0Zf4uarZ0kWUlJeHvibmm7j5gxmdMwGh7WOrdPfft0g0MWifWXPua
 OdhK4mVv+pW4RP178SqgI8cI1MBX0EuoF5MefcjAbUEvklNe6G5+/dMcx+1t7UKRsdvM
 2mX2D2PGS3yrAT15vtE+fUxs6PqXEsuP3dXcnRHlUCCemI/Y2EPGl4wcJ5A9Tnqtl1Wf
 01pb2n+/is7eZYct83aHFss+43kvC4oUQrWJT8GokhwbQy/STdbRg3+grxtHf0rINcE7
 zBjP55wNaZTAZp6f0+ylA6rVZBA7uaopYLVtZgV8EOHYjFgq/J+JgGSwSKrSJLy4mf6Q
 wRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
 bh=xw+UHeE/WlPnjS6igLkf6cJqO8zrJISeOqFOIYWeGw8=;
 b=FC2uVi+M9gyUrxqOSePgj2XQjGA7o3c09O1BEzgHbAwJPIEH/UI8UxSnuVTW8tz1AR
 xgKlUXGy4/7Z5pJKNZQDp3NTADimuXZZjbWkb5kg3yTCxxt+2JuA/jVnyhAWUiW+CPhh
 IgLKugdidgtl0HR1+O76cfWo/eU2CayXmx4O7Hswweva+636TcJzDbmJigbg4UYT8l8i
 rElfpr1XYa03ccWBI2b9xii0iGgz4EaTNpqnmAZCI4BDg0t1kElYMl70kup77erEGWCU
 lU6HeQ8xUK1R7a/I/2cejWK3tiipgUzuW2lHbl5tN8+XGt/tUBPZ10rwCpxz7lMiBia3
 Mw6A==
X-Gm-Message-State: AOAM531UVBGFPwtM7fLWNqivG0TqUkWgkkJP0VvfWFJMULKTbcBn4tsg
 oYV0RDFuB1hX6TgaX2oVEqcltA==
X-Google-Smtp-Source: ABdhPJxPbAL06VaiIJ4LoRE4ay/vRaxuEp8IiM0iSs9BoqP58WYoMJjMFLVtYgI3DURnvvLLnVjpWg==
X-Received: by 2002:a17:903:1cd:b0:154:5edf:5704 with SMTP id
 e13-20020a17090301cd00b001545edf5704mr3141082plh.26.1647849056619; 
 Mon, 21 Mar 2022 00:50:56 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b011-0007-1667-1874-96eb-8cbd-9f0a.dynamic-ip6.hinet.net.
 [2001:b011:7:1667:1874:96eb:8cbd:9f0a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a056a001a4a00b004f7c76f29c3sm18141955pfv.24.2022.03.21.00.50.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Mar 2022 00:50:56 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E163C4B7-0548-4B37-9E37-E56EFEB0ADEE"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu 00/13] Add tail agnostic behavior for rvv instructions
Message-Id: <A3DC40FA-D929-47A3-9B0D-6BA4F7CFBCDC@sifive.com>
Date: Mon, 21 Mar 2022 15:50:53 +0800
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 Frank Chang <frank.chang@sifive.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=eop.chen@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FAKE_REPLY_B=1.566, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:18:27 -0400
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
X-List-Received-Date: Mon, 21 Mar 2022 07:51:01 -0000


--Apple-Mail=_E163C4B7-0548-4B37-9E37-E56EFEB0ADEE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Hi WeiWei,

Thanks for reviewing this PR.

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Regarding to possible behaviors on agnostic elements to mask =
instructions, I
want to ask for you and other's opinion on this proposed PR before =
sending the
next version.

I understand that there are multiple possibility for agnostic elements
according to v-spec. The main intent of this patch-set tries to add =
option that
can distinguish between tail policies. Setting agnostic elements to all =
1s
makes things simple and allow qemu to express that the element is =
agnostic.
Therefore I want unify **all** agnostic elements to be set to 1s in this =
when
this option is enabled.

To avoid affecting the current behavior, the option is default to =
=E2=80=9Cdisabled".
This option is an extra feature to offer so users that care can enable =
it on
their will.

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Here are some replies to your review comments.

Under [00/13]
> Another question: when rvv_ta_all_1s for vta  is enabled, How about =
vma?=20
> Is it necessary to set the inactive elements to all 1s?

This PR will add tail agnostic feature. I am planning on adding the mask
policy in another PR to keep the size of change more reasonable for =
review.

Under [01/13]
> ESZ can be used in the later patches. Maybe it's better to move this=20=

> patch to  last  and prune redundant DSZ parameter.

ESZ and DSZ are redundant code that aren't cleaned-up in the past =
developments.
I prefer to clean this up first and add it back incrementally in the =
following
commit to make the commits more readable. I do agree with you that =
`ETYPE` is
not a straight-forward naming and I will change them to `ESZ`.

Under [03/13]
> Maybe miss a space here.

Nice catch here, thank you.

Under [04/13]
> ETYPE seems have no other meaning here. Why not use ESZ directly  as=20=

original code.

Yes I agree with you. I will update it in the next version.

Under [05/13]
> Similar to last patch, can use ESZ directly here.

I will update it in the next version.

Under [06/13]
> Use vlmax here and in the previous patches may not contains all the =
tail=20
> elements:
> "When LMUL < 1, the tail includes the elements past VLMAX that are =
held=20
> in the same vector register"

Nice catch for this. I will cover LMUL < 1 cases for all functions in =
the next
version.

Under [07/13]
> Why comment 'clear tail element' here?
> "In addition, except for mask load instructions, any element in the =
tail=20
> of a mask result can also be written with the value the
> mask-producing operation would have calculated with vl=3DVLMAX.
> Furthermore, for mask-logical instructions and vmsbf.m,
> vmsif.m, vmsof.m mask-manipulation instructions, any element in the =
tail=20
> of the result can be written with the value the
> mask-producing operation would have calculated with vl=3DVLEN, SEW=3D8, =
and=20
> LMUL=3D8 (i.e., all bits of the mask register can
> be overwritten)."

I will wait for you and other's reply on my comment on this.

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Thanks again for your time.

Best,

Yueh-Ting (eop) Chen


--Apple-Mail=_E163C4B7-0548-4B37-9E37-E56EFEB0ADEE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div class=3D"">

</div>
<div style=3D"color: rgb(54, 54, 54); font-family: Menlo, Monaco, =
&quot;Courier New&quot;, monospace; line-height: 18px; white-space: =
pre;" class=3D""><div class=3D"">Hi WeiWei,</div><br class=3D""><div =
class=3D"">Thanks for reviewing this PR.</div><br class=3D""><div =
class=3D""><span style=3D"color: rgb(63, 151, 223); font-weight: bold;" =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</span></div><br class=3D""><div =
class=3D"">Regarding to possible behaviors on agnostic elements to mask =
instructions, I</div><div class=3D"">want to ask for you and other's =
opinion on this proposed PR before sending the</div><div class=3D"">next =
version.</div><br class=3D""><div class=3D"">I understand that there are =
multiple possibility for agnostic elements</div><div class=3D"">according =
to v-spec. The main intent of this patch-set tries to add option =
that</div><div class=3D"">can distinguish between tail policies. Setting =
agnostic elements to all 1s</div><div class=3D"">makes things simple and =
allow qemu to express that the element is agnostic.</div><div =
class=3D"">Therefore I want unify <span style=3D"color: rgb(63, 151, =
223); font-weight: bold;" class=3D"">**all**</span> agnostic elements to =
be set to 1s in this when</div><div class=3D"">this option is =
enabled.</div><br class=3D""><div class=3D"">To avoid affecting the =
current behavior, the option is default to =E2=80=9Cdisabled".</div><div =
class=3D"">This option is an extra feature to offer so users that care =
can enable it on</div><div class=3D"">their will.</div><br class=3D""><div=
 class=3D""><span style=3D"color: rgb(63, 151, 223); font-weight: bold;" =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</span></div><br class=3D""><div class=3D"">Here =
are some replies to your review comments.</div><br class=3D""><div =
class=3D"">Under [00/13]</div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> Another question: when =
rvv_ta_all_1s for vta  is enabled, How about vma? </div><div =
class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> Is it necessary to set the inactive elements to =
all 1s?</div><br class=3D""><div class=3D"">This PR will add tail =
agnostic feature. I am planning on adding the mask</div><div =
class=3D"">policy in another PR to keep the size of change more =
reasonable for review.</div><br class=3D""><div class=3D"">Under =
[01/13]</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> ESZ can be used in the later patches. Maybe it's =
better to move this </div><div class=3D""><span style=3D"color: rgb(146, =
205, 120);" class=3D"">&gt;</span> patch to  last  and prune redundant =
DSZ parameter.</div><br class=3D""><div class=3D"">ESZ and DSZ are =
redundant code that aren't cleaned-up in the past =
developments.</div><div class=3D"">I prefer to clean this up first and =
add it back incrementally in the following</div><div class=3D"">commit =
to make the commits more readable. I do agree with you that <span =
style=3D"color: rgb(162, 86, 55);" class=3D"">`ETYPE`</span> =
is</div><div class=3D"">not a straight-forward naming and I will change =
them to <span style=3D"color: rgb(162, 86, 55);" =
class=3D"">`ESZ`</span>.</div><br class=3D""><div class=3D"">Under =
[03/13]</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> Maybe miss a space here.</div><br class=3D""><div =
class=3D"">Nice catch here, thank you.</div><br class=3D""><div =
class=3D"">Under [04/13]</div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> ETYPE seems have no other =
meaning here. Why not use ESZ directly  as </div><div class=3D"">original =
code.</div><br class=3D""><div class=3D"">Yes I agree with you. I will =
update it in the next version.</div><br class=3D""><div class=3D"">Under =
[05/13]</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> Similar to last patch, can use ESZ directly =
here.</div><br class=3D""><div class=3D"">I will update it in the next =
version.</div><br class=3D""><div class=3D"">Under [06/13]</div><div =
class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> Use vlmax here and in the previous patches may =
not contains all the tail </div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> elements:</div><div =
class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> "When LMUL &lt; 1, the tail includes the elements =
past VLMAX that are held </div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> in the same vector =
register"</div><br class=3D""><div class=3D"">Nice catch for this. I =
will cover LMUL &lt; 1 cases for all functions in the next</div><div =
class=3D"">version.</div><br class=3D""><div class=3D"">Under =
[07/13]</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> Why comment 'clear tail element' here?</div><div =
class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> "In addition, except for mask load instructions, =
any element in the tail </div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> of a mask result can also be =
written with the value the</div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> mask-producing operation =
would have calculated with vl=3DVLMAX.</div><div class=3D""><span =
style=3D"color: rgb(146, 205, 120);" class=3D"">&gt;</span> Furthermore, =
for mask-logical instructions and vmsbf.m,</div><div class=3D""><span =
style=3D"color: rgb(146, 205, 120);" class=3D"">&gt;</span> vmsif.m, =
vmsof.m mask-manipulation instructions, any element in the tail =
</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> of the result can be written with the value =
the</div><div class=3D""><span style=3D"color: rgb(146, 205, 120);" =
class=3D"">&gt;</span> mask-producing operation would have calculated =
with vl=3DVLEN, SEW=3D8, and </div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> LMUL=3D8 (i.e., all bits of =
the mask register can</div><div class=3D""><span style=3D"color: =
rgb(146, 205, 120);" class=3D"">&gt;</span> be overwritten)."</div><br =
class=3D""><div class=3D"">I will wait for you and other's reply on my =
comment on this.</div><br class=3D""><div class=3D""><span style=3D"color:=
 rgb(63, 151, 223); font-weight: bold;" =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</span></div><br class=3D""><div class=3D"">Thanks=
 again for your time.</div><br class=3D""><div class=3D"">Best,</div><br =
class=3D""><div class=3D"">Yueh-Ting (eop) Chen</div><br =
class=3D""></div></body></html>=

--Apple-Mail=_E163C4B7-0548-4B37-9E37-E56EFEB0ADEE--

