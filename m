Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njYb6-0006pe-PR
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 23:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njYb1-0006pA-RK
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 23:44:08 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1njYay-0007eN-OY
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 23:44:07 -0400
Received: by mail-pg1-x535.google.com with SMTP id t13so459127pgn.8
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 20:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=j7lCCui6UNGbnUl4nUeNEl27kj9L3xZSpDJK/8+clP0=;
 b=eafrYjJiJbCmxcRJ1R5bQvVQaOnaUOVEiAE3ZX7bPL8UAsS7YyITtab1+pOOfQPCV0
 axkA32A3G7kTSYttvkp8vYLPhXBncEWhn3jv1rqc9WWebPJkgra4fBFuTTRBaUQgXvcu
 KSvTt6WhPkp5JY5EHgiQFT83oaCYyYxZqjxQU1XlG4yTFAmzWQfwpWcmFXxX5x692yFv
 tsxFUB+dp4r1KVKHSWQplFJ0GcycSqSsyYGBZ7N/ritZk+Cvhy7CNoNQqVvg1zlLU/Yb
 EvvZzxmAJ5kRbwm1Om5EXbDZt1vfvFKVZ8aUCuaUeuNT+VGfKfvyyivQDyH/ciUifN4/
 +vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=j7lCCui6UNGbnUl4nUeNEl27kj9L3xZSpDJK/8+clP0=;
 b=hT4atD56XxFUGYN7MAzO+U8hrHDYmh3F5t6Vdi5p93H2UDaaoErnsqySG48GtvvZ27
 GpZvwliqBKPiS2Nx4NLMRvtuGTdqpO67dFxSwi14QAWql01rMWpCS8myl7s5MhptQowy
 ASk6URZalbH0cTPL6ISEuOLq1We5TinotL7iQ2JrweeC4y4tdS2/pAdPWT+MwUQwZSBp
 8yKo1/Aju/PJ3Qicz9sqfuDr7wSA0Ga5Oj5lggQeoXOcNq4cASaBKA0d9/Y86n92YUWI
 +fVlbmjQgSN3HMIGXigWgtw+kf/yhs/EJEFhZBPRAkoDRhSe8xk3aOa5xaa3knRvPr8r
 ptZg==
X-Gm-Message-State: AOAM531OizdKMXD4cx5tWfJyFZnOd6ieiEnJAL3FJnxtR5c3jkaLxoam
 VNF/d5I9jOXSAWe4TpqPef7HEw==
X-Google-Smtp-Source: ABdhPJyI6KUldB8KNf/VsCjShrfAPGjGxJSdvGrVEWJGvOxAwFkc2ger/wAmBonR5nONqr89X5PJFw==
X-Received: by 2002:a65:6a01:0:b0:3aa:b8:afc3 with SMTP id
 m1-20020a656a01000000b003aa00b8afc3mr22052195pgu.348.1651031042987; 
 Tue, 26 Apr 2022 20:44:02 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e235-7644-9cc6-88c6-245c-273d.emome-ip6.hinet.net.
 [2001:b400:e235:7644:9cc6:88c6:245c:273d])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a637404000000b00375948e63d6sm14082306pgc.91.2022.04.26.20.44.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Apr 2022 20:44:02 -0700 (PDT)
From: eop Chen <eop.chen@sifive.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_FEBAD098-A147-4B42-A2DC-F4EECD42E4C2"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
Date: Wed, 27 Apr 2022 11:43:58 +0800
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
 <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
 <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
 <c79a9d80-5723-8f17-9094-e8447d4d7b5a@iscas.ac.cn>
 <C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com>
 <50622e83-c871-e2c6-e4fb-61932dfa3850@iscas.ac.cn>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
In-Reply-To: <50622e83-c871-e2c6-e4fb-61932dfa3850@iscas.ac.cn>
Message-Id: <8871BFB5-8DEF-4BE5-9A05-FFC4A8D0DAC5@sifive.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=eop.chen@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 03:44:10 -0000


--Apple-Mail=_FEBAD098-A147-4B42-A2DC-F4EECD42E4C2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Weiwei Li <liweiwei@iscas.ac.cn> =E6=96=BC 2022=E5=B9=B44=E6=9C=8827=E6=97=
=A5 =E4=B8=8A=E5=8D=8811:27 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
>=20
>=20
> =E5=9C=A8 2022/4/27 =E4=B8=8A=E5=8D=8810:07, eop Chen =E5=86=99=E9=81=93=
:
>>=20
>>=20
>>>=20
>>> =E5=9C=A8 2022/4/27 =E4=B8=8A=E5=8D=882:20, eop Chen =E5=86=99=E9=81=93=
:
>>>>=20
>>>>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> =E6=96=
=BC 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 =E4=B8=8B=E5=8D=884:47 =E5=AF=AB=E9=
=81=93=EF=BC=9A
>>>>> =E5=9C=A8 2022/3/17 =E4=B8=8B=E5=8D=883:26, ~eopxd =E5=86=99=E9=81=93=
:
>>>>>> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>>>>>>=20
>>>>>> This is the first commit regarding the mask agnostic behavior.
>>>>>> Added option 'rvv_ma_all_1s' to enable the behavior, the option
>>>>>> is default to false.
>>>>>>=20
>>>>>> Signed-off-by: eop Chen <eop.chen@sifive.com> =
<mailto:eop.chen@sifive.com>
>>>>>> Reviewed-by: Frank Chang <frank.chang@sifive.com> =
<mailto:frank.chang@sifive.com>
>>>>> Similar to our last discussion,  vext_set_elems_1s_fns array can =
be simplified to single vext_set_elems_1s,
>>>>>=20
>>>>> since the fourth argement can be used as the start offset.=20
>>>>>=20
>>>>> Another question, may be not related to this patchset, in section =
3.4.3 of the spec:=20
>>>>>=20
>>>>> "Mask destination tail elements are always treated as =
tail-agnostic, regardless of the setting of vta."
>>>>>=20
>>>>> What does "Mask destination tail elements" mean?
>>>>>=20
>>>>> Regards,
>>>>>=20
>>>>> Weiwei Li
>>>>>=20
>>>>=20
>>>>=20
>>>> I have just updated a new version for the tail agnostic patch set, =
it also includes a bug fix discovered today.
>>>>=20
>>>> Regarding the question, mask / masked-off are for body elements and =
respects the mask policy, and tail elements respect the tail policy.
>>>>=20
>>>> Regards,
>>>>=20
>>>> eop Chen
>>>=20
>>> I find another descriptions in the spec. For the instructions that =
write mask register (such as vmadc, vmseq,vmsne,vmfeq...), they all have =
similar description
>>>=20
>>> (You can search "tail-agnostic" in the spec):
>>>=20
>>> Section 11.4: "Because these instructions produce a mask value, they =
always operate with a tail-agnostic policy"
>>>=20
>>> Section 11.8/13.13: "Compares write mask registers, and so always =
operate under a tail-agnostic policy"
>>>=20
>>> Section 15.1: "Mask elements past vl, the tail elements, are always =
updated with a tail-agnostic policy"
>>>=20
>>> Section 15.4/15.5/15.6: "The tail elements in the destination mask =
register are updated under a tail-agnostic policy"
>>>=20
>>> So I think "Mask destination tail elements" may means the tail =
element for instructions that take mask register as destination =
register.  For these instructions,=20
>>>=20
>>> maybe the setting of VTA can be ignored. =20
>>>=20
>>> Regards,
>>>=20
>>> Weiwei Li
>>>=20
>>=20
>> Yes, the setting of VTA should be ignored when v-spec specifies.
>> I think the implementation of the tail agnostic patch set don=E2=80=99t=
 need to change on this.
> Sorry. I don't get your idea?=20
>=20
> In current patch, these instructions seems need to set the tail =
elements to 1s when vta is true which means
>=20
> VTA is setted and rvv_ta_all_1s is enabled. If setting of VTA should =
be ignored for these instrucitons, =20
>=20
> they will set the tail elements to 1s only when rvv_ta_all_1s is =
enabled.
>=20
> Regards,
>=20
> Weiwei Li
>=20
>>=20
>> Regards,
>>=20
>> eop Chen
>>=20
>>=20
>>=20

I see your point now. Yes the implementation should be changed.
Let me submit a new version for this.

Regards,

eop Chen



--Apple-Mail=_FEBAD098-A147-4B42-A2DC-F4EECD42E4C2
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
class=3D"">liweiwei@iscas.ac.cn</a>&gt; =E6=96=BC 2022=E5=B9=B44=E6=9C=882=
7=E6=97=A5 =E4=B8=8A=E5=8D=8811:27 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
 =20
  <div class=3D""><p class=3D""><br class=3D"">
    </p>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/4/27 =E4=B8=8A=E5=8D=881=
0:07, eop Chen =E5=86=99=E9=81=93:<br class=3D"">
    </div>
    <blockquote type=3D"cite" =
cite=3D"mid:C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com" class=3D"">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
      <br class=3D"">
      <div class=3D"">
      </div>
      <div class=3D""><br class=3D"">
        <blockquote type=3D"cite" class=3D"">
          <div class=3D""><br class=3D"">
          </div>
          <div class=3D"">
            <div class=3D"">
              <div class=3D"moz-cite-prefix">=E5=9C=A8 2022/4/27 =
=E4=B8=8A=E5=8D=882:20, eop Chen
                =E5=86=99=E9=81=93:<br class=3D"">
              </div>
              <blockquote type=3D"cite" =
cite=3D"mid:240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com" class=3D"">
                <meta http-equiv=3D"Content-Type" content=3D"text/html;
                  charset=3DUTF-8" class=3D"">
                <br class=3D"">
                <div class=3D"">
                  <blockquote type=3D"cite" class=3D"">
                    <div class=3D"">Weiwei Li &lt;<a =
href=3D"mailto:liweiwei@iscas.ac.cn" class=3D"" =
moz-do-not-send=3D"true">liweiwei@iscas.ac.cn</a>&gt;
                      =E6=96=BC 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 =
=E4=B8=8B=E5=8D=884:47 =E5=AF=AB=E9=81=93=EF=BC=9A</div>
                    <div class=3D"">
                      <div class=3D"">
                        <div class=3D"moz-cite-prefix">=E5=9C=A8 =
2022/3/17 =E4=B8=8B=E5=8D=883:26,
                          ~eopxd =E5=86=99=E9=81=93:<br class=3D"">
                        </div>
                        <blockquote type=3D"cite" =
cite=3D"mid:165089631935.4839.7564289944057093570-1@git.sr.ht" class=3D"">=

                          <pre class=3D"moz-quote-pre" wrap=3D"">From: =
Yueh-Ting (eop) Chen <a class=3D"moz-txt-link-rfc2396E" =
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
                          vext_set_elems_1s_fns array can be simplified
                          to single vext_set_elems_1s,<br class=3D"">
                        </p><p class=3D"">since the fourth argement can =
be
                          used as the start offset. <br class=3D"">
                        </p><p class=3D"">Another question, may be not =
related
                          to this patchset, in section 3.4.3 of the
                          spec: <br class=3D"">
                        </p><p class=3D""><i class=3D"">"Mask =
destination tail
                            elements are always treated as
                            tail-agnostic, regardless of the setting of
                            vta."</i></p><p class=3D"">What does "Mask =
destination tail
                          elements" mean?</p><p class=3D"">Regards,</p><p =
class=3D"">Weiwei Li<br class=3D"">
                        </p>
                      </div>
                    </div>
                  </blockquote>
                </div>
                <div class=3D""><br class=3D"">
                </div>
                <div class=3D"">I have just updated a new version for =
the
                  tail agnostic patch set, it also includes a bug fix
                  discovered today.</div>
                <div class=3D""><br class=3D"">
                </div>
                <div class=3D"">Regarding the question, mask / =
masked-off
                  are for body elements and respects the mask policy,
                  and tail elements respect the tail policy.</div>
                <div class=3D""><br class=3D"">
                </div>
                <div class=3D"">Regards,</div>
                <div class=3D""><br class=3D"">
                </div>
                <div class=3D"">eop Chen</div>
              </blockquote>
              <br class=3D""><p class=3D"">I find another descriptions =
in the spec. For
                the instructions that write mask register (such as
                vmadc, vmseq,vmsne,vmfeq...), they all have similar
                description</p><p class=3D"">(You can search =
"tail-agnostic" in the spec):</p><p class=3D""><i class=3D"">Section =
11.4: "Because these
                  instructions produce a mask value, they always operate
                  with a tail-agnostic policy"</i><i class=3D""><br =
class=3D"">
                </i></p><p class=3D""><i class=3D"">Section 11.8/13.13: =
"Compares </i><i class=3D"">write mask registers, and so always operate
                  under a tail-agnostic policy"</i><i class=3D""><br =
class=3D"">
                </i></p><p class=3D""><i class=3D"">Section 15.1: "Mask =
elements past
                  vl, the tail elements, are always updated with a
                  tail-agnostic policy"</i><i class=3D""><br class=3D"">
                </i> </p>
              <i class=3D""> </i><p class=3D""><i class=3D"">Section =
15.4/15.5/15.6: "The tail
                  elements in the destination mask register are updated
                  under a tail-agnostic policy"</i><br class=3D"">
              </p><p class=3D"">So I think "Mask destination tail =
elements"
                may means the tail element for instructions that take
                mask register as destination register.&nbsp; For these
                instructions, <br class=3D"">
              </p><p class=3D"">maybe the setting of VTA can be =
ignored.&nbsp; <br class=3D"">
              </p><p class=3D"">Regards,</p><p class=3D"">Weiwei Li<br =
class=3D"">
              </p>
            </div>
          </div>
        </blockquote>
      </div>
      <br class=3D"">
      <div class=3D"">Yes, the setting of VTA should be ignored when
        v-spec specifies.</div>
      <div class=3D"">I think the implementation of the tail agnostic
        patch set don=E2=80=99t need to change on this.</div>
    </blockquote><p class=3D"">Sorry. I don't get your idea? <br =
class=3D"">
    </p><p class=3D"">In current patch, these instructions seems need to =
set the tail
      elements to 1s when vta is true which means</p><p class=3D""> VTA =
is setted and rvv_ta_all_1s is enabled. If setting of VTA
      should be ignored for these instrucitons,&nbsp; <br class=3D"">
    </p><p class=3D"">they will set the tail elements to 1s only when =
rvv_ta_all_1s is
      enabled.</p><p class=3D"">Regards,</p><p class=3D"">Weiwei Li<br =
class=3D"">
    </p>
    <blockquote type=3D"cite" =
cite=3D"mid:C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com" class=3D"">
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">Regards,</div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">eop Chen</div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D""><br class=3D"">
      </div>
    </blockquote>
  </div>

</div></blockquote></div><br class=3D""><div class=3D"">I see your point =
now. Yes the implementation should be changed.</div><div class=3D"">Let =
me submit a new version for this.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Regards,</div><div class=3D""><br =
class=3D""></div><div class=3D"">eop Chen</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_FEBAD098-A147-4B42-A2DC-F4EECD42E4C2--

