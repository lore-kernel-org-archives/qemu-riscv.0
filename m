Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWGIl-0002xQ-6l
	for mharc-qemu-riscv@gnu.org; Mon, 21 Mar 2022 07:34:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWGIg-0002vh-Ja; Mon, 21 Mar 2022 07:34:15 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:59064 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nWGIZ-0008GV-Di; Mon, 21 Mar 2022 07:34:13 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3V_CjYjhis9ujBA--.51199S2;
 Mon, 21 Mar 2022 19:33:55 +0800 (CST)
Subject: Re: [PATCH qemu 00/13] Add tail agnostic behavior for rvv instructions
To: eop Chen <eop.chen@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 Frank Chang <frank.chang@sifive.com>
References: <A3DC40FA-D929-47A3-9B0D-6BA4F7CFBCDC@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <711b07f9-d3ca-a091-bca9-e77795777d25@iscas.ac.cn>
Date: Mon, 21 Mar 2022 19:33:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <A3DC40FA-D929-47A3-9B0D-6BA4F7CFBCDC@sifive.com>
Content-Type: multipart/alternative;
 boundary="------------F542D37D11DA2DF44750B68C"
Content-Language: en-US
X-CM-TRANSID: zQCowAB3V_CjYjhis9ujBA--.51199S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArW3Xr4xuFWUtF1fJrW7twb_yoWrJFyUpF
 s5t34Iyr4kJa4xGwn7ZrW8XF1Fyrs5Ja15Jr18Gr1UA345Gw18KF1ftr4YyF1UGr1UZr1j
 vr1Utrn5Zws8CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7M4xvF2IEb7IF0Fy264kE64k0F24l7480Y4vEI4kI2Ix0rVAqx4xJ
 Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r1j6r4UMVCEFcxC0VAYjxAxZFUvcSsGvfC2KfnxnUUI43ZEXa7VUjpuWJUUUUU=
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 21 Mar 2022 11:34:15 -0000

This is a multi-part message in MIME format.
--------------F542D37D11DA2DF44750B68C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/21 下午3:50, eop Chen 写道:
>
> Hi WeiWei,
> Thanks for reviewing this PR.
> ===============================================================================
> Regarding to possible behaviors on agnostic elements to mask 
> instructions, I
> want to ask for you and other's opinion on this proposed PR before 
> sending the
> next version.
> I understand that there are multiple possibility for agnostic elements
> according to v-spec. The main intent of this patch-set tries to add 
> option that
> can distinguish between tail policies. Setting agnostic elements to all 1s
> makes things simple and allow qemu to express that the element is 
> agnostic.
> Therefore I want unify **all** agnostic elements to be set to 1s in 
> this when
> this option is enabled.
> To avoid affecting the current behavior, the option is default to 
> “disabled".
> This option is an extra feature to offer so users that care can enable 
> it on
> their will.
> ===============================================================================
> Here are some replies to your review comments.
> Under [00/13]
> > Another question: when rvv_ta_all_1s for vta is enabled, How about vma?
> > Is it necessary to set the inactive elements to all 1s?
> This PR will add tail agnostic feature. I am planning on adding the mask
> policy in another PR to keep the size of change more reasonable for 
> review.

Yeah, It's truly another question. I just wonder about whether they 
should take the same agnostic policy,

or can take different policies?

> Under [01/13]
> > ESZ can be used in the later patches. Maybe it's better to move this
> > patch to last and prune redundant DSZ parameter.
> ESZ and DSZ are redundant code that aren't cleaned-up in the past 
> developments.
> I prefer to clean this up first and add it back incrementally in the 
> following
> commit to make the commits more readable. I do agree with you that 
> `ETYPE` is
> not a straight-forward naming and I will change them to `ESZ`.
OK. It's also acceptable to me.
> Under [03/13]
> > Maybe miss a space here.
> Nice catch here, thank you.
> Under [04/13]
> > ETYPE seems have no other meaning here. Why not use ESZ directly as
> original code.
> Yes I agree with you. I will update it in the next version.
> Under [05/13]
> > Similar to last patch, can use ESZ directly here.
> I will update it in the next version.
> Under [06/13]
> > Use vlmax here and in the previous patches may not contains all the tail
> > elements:
> > "When LMUL < 1, the tail includes the elements past VLMAX that are held
> > in the same vector register"
> Nice catch for this. I will cover LMUL < 1 cases for all functions in 
> the next
> version.
> Under [07/13]
> > Why comment 'clear tail element' here?
> > "In addition, except for mask load instructions, any element in the tail
> > of a mask result can also be written with the value the
> > mask-producing operation would have calculated with vl=VLMAX.
> > Furthermore, for mask-logical instructions and vmsbf.m,
> > vmsif.m, vmsof.m mask-manipulation instructions, any element in the tail
> > of the result can be written with the value the
> > mask-producing operation would have calculated with vl=VLEN, SEW=8, and
> > LMUL=8 (i.e., all bits of the mask register can
> > be overwritten)."
> I will wait for you and other's reply on my comment on this.

I'm also not sure about this.In my personal opinion:

The policy that overwrite tail element with 1s can also be used here 
(just the elements become 1 bit) as you

have done. However the comment 'clear tail element'  seems not suitable.

The above two policies can be other choices that enabled by other options.

Regards,
Weiwei Li
> ===============================================================================
> Thanks again for your time.
> Best,
> Yueh-Ting (eop) Chen

--------------F542D37D11DA2DF44750B68C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+PGJyPgogICAgPC9wPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij7l
nKggMjAyMi8zLzIxIOS4i+WNiDM6NTAsIGVvcCBDaGVuIOWGmemBkzo8YnI+CiAgICA8L2Rp
dj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDpBM0RDNDBG
QS1EOTI5LTQ3QTMtOUIwRC02QkE0RjdDRkJDRENAc2lmaXZlLmNvbSI+CiAgICAgIDxtZXRh
IGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0
PVVURi04Ij4KICAgICAgPGJyIGNsYXNzPSIiPgogICAgICA8ZGl2IGNsYXNzPSIiPgogICAg
ICA8L2Rpdj4KICAgICAgPGRpdiBzdHlsZT0iY29sb3I6IHJnYig1NCwgNTQsIDU0KTsgZm9u
dC1mYW1pbHk6IE1lbmxvLCBNb25hY28sICZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7LCBtb25v
c3BhY2U7IGxpbmUtaGVpZ2h0OiAxOHB4OyB3aGl0ZS1zcGFjZTogcHJlOyIgY2xhc3M9IiI+
PGRpdiBjbGFzcz0iIj5IaSBXZWlXZWksPC9kaXY+CjxkaXYgY2xhc3M9IiI+VGhhbmtzIGZv
ciByZXZpZXdpbmcgdGhpcyBQUi48L2Rpdj4KPGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0i
Y29sb3I6IHJnYig2MywgMTUxLCAyMjMpOyBmb250LXdlaWdodDogYm9sZDsiIGNsYXNzPSIi
Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT08L3NwYW4+PC9kaXY+CjxkaXYgY2xhc3M9IiI+
UmVnYXJkaW5nIHRvIHBvc3NpYmxlIGJlaGF2aW9ycyBvbiBhZ25vc3RpYyBlbGVtZW50cyB0
byBtYXNrIGluc3RydWN0aW9ucywgSTwvZGl2PjxkaXYgY2xhc3M9IiI+d2FudCB0byBhc2sg
Zm9yIHlvdSBhbmQgb3RoZXIncyBvcGluaW9uIG9uIHRoaXMgcHJvcG9zZWQgUFIgYmVmb3Jl
IHNlbmRpbmcgdGhlPC9kaXY+PGRpdiBjbGFzcz0iIj5uZXh0IHZlcnNpb24uPC9kaXY+Cjxk
aXYgY2xhc3M9IiI+SSB1bmRlcnN0YW5kIHRoYXQgdGhlcmUgYXJlIG11bHRpcGxlIHBvc3Np
YmlsaXR5IGZvciBhZ25vc3RpYyBlbGVtZW50czwvZGl2PjxkaXYgY2xhc3M9IiI+YWNjb3Jk
aW5nIHRvIHYtc3BlYy4gVGhlIG1haW4gaW50ZW50IG9mIHRoaXMgcGF0Y2gtc2V0IHRyaWVz
IHRvIGFkZCBvcHRpb24gdGhhdDwvZGl2PjxkaXYgY2xhc3M9IiI+Y2FuIGRpc3Rpbmd1aXNo
IGJldHdlZW4gdGFpbCBwb2xpY2llcy4gU2V0dGluZyBhZ25vc3RpYyBlbGVtZW50cyB0byBh
bGwgMXM8L2Rpdj48ZGl2IGNsYXNzPSIiPm1ha2VzIHRoaW5ncyBzaW1wbGUgYW5kIGFsbG93
IHFlbXUgdG8gZXhwcmVzcyB0aGF0IHRoZSBlbGVtZW50IGlzIGFnbm9zdGljLjwvZGl2Pjxk
aXYgY2xhc3M9IiI+VGhlcmVmb3JlIEkgd2FudCB1bmlmeSA8c3BhbiBzdHlsZT0iY29sb3I6
IHJnYig2MywgMTUxLCAyMjMpOyBmb250LXdlaWdodDogYm9sZDsiIGNsYXNzPSIiPioqYWxs
Kio8L3NwYW4+IGFnbm9zdGljIGVsZW1lbnRzIHRvIGJlIHNldCB0byAxcyBpbiB0aGlzIHdo
ZW48L2Rpdj48ZGl2IGNsYXNzPSIiPnRoaXMgb3B0aW9uIGlzIGVuYWJsZWQuPC9kaXY+Cjxk
aXYgY2xhc3M9IiI+VG8gYXZvaWQgYWZmZWN0aW5nIHRoZSBjdXJyZW50IGJlaGF2aW9yLCB0
aGUgb3B0aW9uIGlzIGRlZmF1bHQgdG8g4oCcZGlzYWJsZWQiLjwvZGl2PjxkaXYgY2xhc3M9
IiI+VGhpcyBvcHRpb24gaXMgYW4gZXh0cmEgZmVhdHVyZSB0byBvZmZlciBzbyB1c2VycyB0
aGF0IGNhcmUgY2FuIGVuYWJsZSBpdCBvbjwvZGl2PjxkaXYgY2xhc3M9IiI+dGhlaXIgd2ls
bC48L2Rpdj4KPGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig2MywgMTUx
LCAyMjMpOyBmb250LXdlaWdodDogYm9sZDsiIGNsYXNzPSIiPj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT08L3NwYW4+PC9kaXY+CjxkaXYgY2xhc3M9IiI+SGVyZSBhcmUgc29tZSByZXBs
aWVzIHRvIHlvdXIgcmV2aWV3IGNvbW1lbnRzLjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPlVuZGVy
IFswMC8xM108L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0
NiwgMjA1LCAxMjApOyIgY2xhc3M9IiI+Jmd0Ozwvc3Bhbj4gQW5vdGhlciBxdWVzdGlvbjog
d2hlbiBydnZfdGFfYWxsXzFzIGZvciB2dGEgIGlzIGVuYWJsZWQsIEhvdyBhYm91dCB2bWE/
IDwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTQ2LCAyMDUs
IDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiBJcyBpdCBuZWNlc3NhcnkgdG8gc2V0IHRo
ZSBpbmFjdGl2ZSBlbGVtZW50cyB0byBhbGwgMXM/PC9kaXY+CjxkaXYgY2xhc3M9IiI+VGhp
cyBQUiB3aWxsIGFkZCB0YWlsIGFnbm9zdGljIGZlYXR1cmUuIEkgYW0gcGxhbm5pbmcgb24g
YWRkaW5nIHRoZSBtYXNrPC9kaXY+PGRpdiBjbGFzcz0iIj5wb2xpY3kgaW4gYW5vdGhlciBQ
UiB0byBrZWVwIHRoZSBzaXplIG9mIGNoYW5nZSBtb3JlIHJlYXNvbmFibGUgZm9yIHJldmll
dy48L2Rpdj48L2Rpdj4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPlllYWgsIEl0J3MgdHJ1
bHkgYW5vdGhlciBxdWVzdGlvbi4gSSBqdXN0IHdvbmRlciBhYm91dCB3aGV0aGVyCiAgICAg
IHRoZXkgc2hvdWxkIHRha2UgdGhlIHNhbWUgYWdub3N0aWMgcG9saWN5LDwvcD4KICAgIDxw
Pm9yIGNhbiB0YWtlIGRpZmZlcmVudCBwb2xpY2llcz88L3A+CiAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6QTNEQzQwRkEtRDkyOS00N0EzLTlCMEQtNkJB
NEY3Q0ZCQ0RDQHNpZml2ZS5jb20iPgogICAgICA8ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDU0
LCA1NCwgNTQpOyBmb250LWZhbWlseTogTWVubG8sIE1vbmFjbywgJnF1b3Q7Q291cmllciBO
ZXcmcXVvdDssIG1vbm9zcGFjZTsgbGluZS1oZWlnaHQ6IDE4cHg7IHdoaXRlLXNwYWNlOiBw
cmU7IiBjbGFzcz0iIj4KPGRpdiBjbGFzcz0iIj5VbmRlciBbMDEvMTNdPC9kaXY+PGRpdiBj
bGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIwKTsiIGNsYXNz
PSIiPiZndDs8L3NwYW4+IEVTWiBjYW4gYmUgdXNlZCBpbiB0aGUgbGF0ZXIgcGF0Y2hlcy4g
TWF5YmUgaXQncyBiZXR0ZXIgdG8gbW92ZSB0aGlzIDwvZGl2PjxkaXYgY2xhc3M9IiI+PHNw
YW4gc3R5bGU9ImNvbG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9z
cGFuPiBwYXRjaCB0byAgbGFzdCAgYW5kIHBydW5lIHJlZHVuZGFudCBEU1ogcGFyYW1ldGVy
LjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPkVTWiBhbmQgRFNaIGFyZSByZWR1bmRhbnQgY29kZSB0
aGF0IGFyZW4ndCBjbGVhbmVkLXVwIGluIHRoZSBwYXN0IGRldmVsb3BtZW50cy48L2Rpdj48
ZGl2IGNsYXNzPSIiPkkgcHJlZmVyIHRvIGNsZWFuIHRoaXMgdXAgZmlyc3QgYW5kIGFkZCBp
dCBiYWNrIGluY3JlbWVudGFsbHkgaW4gdGhlIGZvbGxvd2luZzwvZGl2PjxkaXYgY2xhc3M9
IiI+Y29tbWl0IHRvIG1ha2UgdGhlIGNvbW1pdHMgbW9yZSByZWFkYWJsZS4gSSBkbyBhZ3Jl
ZSB3aXRoIHlvdSB0aGF0IDxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE2MiwgODYsIDU1KTsi
IGNsYXNzPSIiPmBFVFlQRWA8L3NwYW4+IGlzPC9kaXY+PGRpdiBjbGFzcz0iIj5ub3QgYSBz
dHJhaWdodC1mb3J3YXJkIG5hbWluZyBhbmQgSSB3aWxsIGNoYW5nZSB0aGVtIHRvIDxzcGFu
IHN0eWxlPSJjb2xvcjogcmdiKDE2MiwgODYsIDU1KTsiIGNsYXNzPSIiPmBFU1pgPC9zcGFu
Pi48L2Rpdj48L2Rpdj4KICAgIDwvYmxvY2txdW90ZT4KICAgIE9LLiBJdCdzIGFsc28gYWNj
ZXB0YWJsZSB0byBtZS48YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBj
aXRlPSJtaWQ6QTNEQzQwRkEtRDkyOS00N0EzLTlCMEQtNkJBNEY3Q0ZCQ0RDQHNpZml2ZS5j
b20iPgogICAgICA8ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDU0LCA1NCwgNTQpOyBmb250LWZh
bWlseTogTWVubG8sIE1vbmFjbywgJnF1b3Q7Q291cmllciBOZXcmcXVvdDssIG1vbm9zcGFj
ZTsgbGluZS1oZWlnaHQ6IDE4cHg7IHdoaXRlLXNwYWNlOiBwcmU7IiBjbGFzcz0iIj4KPGRp
diBjbGFzcz0iIj5VbmRlciBbMDMvMTNdPC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHls
ZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIwKTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IE1h
eWJlIG1pc3MgYSBzcGFjZSBoZXJlLjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPk5pY2UgY2F0Y2gg
aGVyZSwgdGhhbmsgeW91LjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPlVuZGVyIFswNC8xM108L2Rp
dj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0NiwgMjA1LCAxMjAp
OyIgY2xhc3M9IiI+Jmd0Ozwvc3Bhbj4gRVRZUEUgc2VlbXMgaGF2ZSBubyBvdGhlciBtZWFu
aW5nIGhlcmUuIFdoeSBub3QgdXNlIEVTWiBkaXJlY3RseSAgYXMgPC9kaXY+PGRpdiBjbGFz
cz0iIj5vcmlnaW5hbCBjb2RlLjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPlllcyBJIGFncmVlIHdp
dGggeW91LiBJIHdpbGwgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uPC9kaXY+Cjxk
aXYgY2xhc3M9IiI+VW5kZXIgWzA1LzEzXTwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5
bGU9ImNvbG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiBT
aW1pbGFyIHRvIGxhc3QgcGF0Y2gsIGNhbiB1c2UgRVNaIGRpcmVjdGx5IGhlcmUuPC9kaXY+
CjxkaXYgY2xhc3M9IiI+SSB3aWxsIHVwZGF0ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLjwv
ZGl2Pgo8ZGl2IGNsYXNzPSIiPlVuZGVyIFswNi8xM108L2Rpdj48ZGl2IGNsYXNzPSIiPjxz
cGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0NiwgMjA1LCAxMjApOyIgY2xhc3M9IiI+Jmd0Ozwv
c3Bhbj4gVXNlIHZsbWF4IGhlcmUgYW5kIGluIHRoZSBwcmV2aW91cyBwYXRjaGVzIG1heSBu
b3QgY29udGFpbnMgYWxsIHRoZSB0YWlsIDwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5
bGU9ImNvbG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiBl
bGVtZW50czo8L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0
NiwgMjA1LCAxMjApOyIgY2xhc3M9IiI+Jmd0Ozwvc3Bhbj4gIldoZW4gTE1VTCAmbHQ7IDEs
IHRoZSB0YWlsIGluY2x1ZGVzIHRoZSBlbGVtZW50cyBwYXN0IFZMTUFYIHRoYXQgYXJlIGhl
bGQgPC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNDYsIDIw
NSwgMTIwKTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IGluIHRoZSBzYW1lIHZlY3RvciByZWdp
c3RlciI8L2Rpdj4KPGRpdiBjbGFzcz0iIj5OaWNlIGNhdGNoIGZvciB0aGlzLiBJIHdpbGwg
Y292ZXIgTE1VTCAmbHQ7IDEgY2FzZXMgZm9yIGFsbCBmdW5jdGlvbnMgaW4gdGhlIG5leHQ8
L2Rpdj48ZGl2IGNsYXNzPSIiPnZlcnNpb24uPC9kaXY+CjxkaXYgY2xhc3M9IiI+VW5kZXIg
WzA3LzEzXTwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTQ2
LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiBXaHkgY29tbWVudCAnY2xlYXIg
dGFpbCBlbGVtZW50JyBoZXJlPzwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNv
bG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiAiSW4gYWRk
aXRpb24sIGV4Y2VwdCBmb3IgbWFzayBsb2FkIGluc3RydWN0aW9ucywgYW55IGVsZW1lbnQg
aW4gdGhlIHRhaWwgPC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJn
YigxNDYsIDIwNSwgMTIwKTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IG9mIGEgbWFzayByZXN1
bHQgY2FuIGFsc28gYmUgd3JpdHRlbiB3aXRoIHRoZSB2YWx1ZSB0aGU8L2Rpdj48ZGl2IGNs
YXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0NiwgMjA1LCAxMjApOyIgY2xhc3M9
IiI+Jmd0Ozwvc3Bhbj4gbWFzay1wcm9kdWNpbmcgb3BlcmF0aW9uIHdvdWxkIGhhdmUgY2Fs
Y3VsYXRlZCB3aXRoIHZsPVZMTUFYLjwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9
ImNvbG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IiBjbGFzcz0iIj4mZ3Q7PC9zcGFuPiBGdXJ0
aGVybW9yZSwgZm9yIG1hc2stbG9naWNhbCBpbnN0cnVjdGlvbnMgYW5kIHZtc2JmLm0sPC9k
aXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIw
KTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IHZtc2lmLm0sIHZtc29mLm0gbWFzay1tYW5pcHVs
YXRpb24gaW5zdHJ1Y3Rpb25zLCBhbnkgZWxlbWVudCBpbiB0aGUgdGFpbCA8L2Rpdj48ZGl2
IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0NiwgMjA1LCAxMjApOyIgY2xh
c3M9IiI+Jmd0Ozwvc3Bhbj4gb2YgdGhlIHJlc3VsdCBjYW4gYmUgd3JpdHRlbiB3aXRoIHRo
ZSB2YWx1ZSB0aGU8L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdi
KDE0NiwgMjA1LCAxMjApOyIgY2xhc3M9IiI+Jmd0Ozwvc3Bhbj4gbWFzay1wcm9kdWNpbmcg
b3BlcmF0aW9uIHdvdWxkIGhhdmUgY2FsY3VsYXRlZCB3aXRoIHZsPVZMRU4sIFNFVz04LCBh
bmQgPC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNDYsIDIw
NSwgMTIwKTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IExNVUw9OCAoaS5lLiwgYWxsIGJpdHMg
b2YgdGhlIG1hc2sgcmVnaXN0ZXIgY2FuPC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHls
ZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIwKTsiIGNsYXNzPSIiPiZndDs8L3NwYW4+IGJl
IG92ZXJ3cml0dGVuKS4iPC9kaXY+CjxkaXYgY2xhc3M9IiI+SSB3aWxsIHdhaXQgZm9yIHlv
dSBhbmQgb3RoZXIncyByZXBseSBvbiBteSBjb21tZW50IG9uIHRoaXMuPC9kaXY+PC9kaXY+
CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5JJ20gYWxzbyBub3Qgc3VyZSBhYm91dCB0aGlz
LjxzcGFuIGNsYXNzPSIiPiBJbiBteSBwZXJzb25hbAogICAgICAgIG9waW5pb246PC9zcGFu
PjwvcD4KICAgIDxwPjxzcGFuIGNsYXNzPSIiPlRoZSBwb2xpY3kgdGhhdCBvdmVyd3JpdGUg
dGFpbCBlbGVtZW50IHdpdGggMXMgY2FuCiAgICAgICAgYWxzbyBiZSB1c2VkIGhlcmUgPC9z
cGFuPjxzcGFuIGNsYXNzPSIiPjxzcGFuIGNsYXNzPSIiPihqdXN0CiAgICAgICAgICB0aGUg
ZWxlbWVudHMgYmVjb21lIDEgYml0KTwvc3Bhbj4gYXMgeW91IDxicj4KICAgICAgPC9zcGFu
PjwvcD4KICAgIDxwPjxzcGFuIGNsYXNzPSIiPmhhdmUgZG9uZS4gSG93ZXZlciB0aGUgY29t
bWVudCA8L3NwYW4+PHNwYW4KICAgICAgICBjbGFzcz0iIj4nY2xlYXIgdGFpbCBlbGVtZW50
J8KgIHNlZW1zIG5vdCBzdWl0YWJsZS48YnI+CiAgICAgIDwvc3Bhbj48L3A+CiAgICA8ZGl2
IGNsYXNzPSJvdXRwdXQtYmQiIGRpcj0ibHRyIiBzdHlsZT0icGFkZGluZy1ib3R0b206IDBw
eDsiPjxzcGFuCiAgICAgICAgY2xhc3M9IiI+VGhlIGFib3ZlIHR3byBwb2xpY2llcyBjYW4g
YmUgb3RoZXIgY2hvaWNlcyB0aGF0CiAgICAgICAgZW5hYmxlZCBieSBvdGhlciBvcHRpb25z
Ljwvc3Bhbj48L2Rpdj4KICAgIDxkaXYgY2xhc3M9Im91dHB1dC1iZCIgZGlyPSJsdHIiIHN0
eWxlPSJwYWRkaW5nLWJvdHRvbTogMHB4OyI+PHNwYW4KICAgICAgICBjbGFzcz0iIj48YnI+
CiAgICAgIDwvc3Bhbj48L2Rpdj4KICAgIDxkaXYgY2xhc3M9Im91dHB1dC1iZCIgZGlyPSJs
dHIiIHN0eWxlPSJwYWRkaW5nLWJvdHRvbTogMHB4OyI+PHNwYW4KICAgICAgICBjbGFzcz0i
Ij5SZWdhcmRzLDwvc3Bhbj48L2Rpdj4KICAgIDxkaXYgY2xhc3M9Im91dHB1dC1iZCIgZGly
PSJsdHIiIHN0eWxlPSJwYWRkaW5nLWJvdHRvbTogMHB4OyI+PHNwYW4KICAgICAgICBjbGFz
cz0iIj5XZWl3ZWkgTGk8YnI+CiAgICAgIDwvc3Bhbj4gPC9kaXY+CiAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6QTNEQzQwRkEtRDkyOS00N0EzLTlCMEQt
NkJBNEY3Q0ZCQ0RDQHNpZml2ZS5jb20iPgogICAgICA8ZGl2IHN0eWxlPSJjb2xvcjogcmdi
KDU0LCA1NCwgNTQpOyBmb250LWZhbWlseTogTWVubG8sIE1vbmFjbywgJnF1b3Q7Q291cmll
ciBOZXcmcXVvdDssIG1vbm9zcGFjZTsgbGluZS1oZWlnaHQ6IDE4cHg7IHdoaXRlLXNwYWNl
OiBwcmU7IiBjbGFzcz0iIj4KPGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJn
Yig2MywgMTUxLCAyMjMpOyBmb250LXdlaWdodDogYm9sZDsiIGNsYXNzPSIiPj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT08L3NwYW4+PC9kaXY+CjxkaXYgY2xhc3M9IiI+VGhhbmtzIGFn
YWluIGZvciB5b3VyIHRpbWUuPC9kaXY+CjxkaXYgY2xhc3M9IiI+QmVzdCw8L2Rpdj4KPGRp
diBjbGFzcz0iIj5ZdWVoLVRpbmcgKGVvcCkgQ2hlbjwvZGl2Pgo8L2Rpdj4KICAgIDwvYmxv
Y2txdW90ZT4KICA8L2JvZHk+CjwvaHRtbD4K
--------------F542D37D11DA2DF44750B68C--


