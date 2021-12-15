Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxPB7-0003XH-Vb
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 02:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mxPB2-0003Nr-Ej; Wed, 15 Dec 2021 02:58:16 -0500
Received: from forward500o.mail.yandex.net ([37.140.190.195]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mxPAw-0003Ar-Ep; Wed, 15 Dec 2021 02:58:13 -0500
Received: from myt5-36442628f0be.qloud-c.yandex.net
 (myt5-36442628f0be.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1c0c:0:640:3644:2628])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id 44D9C9417A9;
 Wed, 15 Dec 2021 10:58:04 +0300 (MSK)
Received: from myt5-89cdf5c4a3a5.qloud-c.yandex.net
 (myt5-89cdf5c4a3a5.qloud-c.yandex.net [2a02:6b8:c12:289b:0:640:89cd:f5c4])
 by myt5-36442628f0be.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 BehCmZ01Es-w3eKj4wF; Wed, 15 Dec 2021 10:58:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1639555084; bh=h7wtRBQgfq+raHq5Bu+argtYe4gBdysDCB6+DdKy2yM=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=pklwfAfCIZIJdmQiUXiEouHXCwZmglJDcYFsBi3h7QnpK2cgMfLu/seqb7LHBqnSA
 qVnIsmy9jOXIkWGL9quVCP5J+exc+JC+S0KqT6DcGLPREKPmvl9iqyHSxm4hIFWWsb
 ai3wUYDkXkeJaVTPx2/6fbRBZtBm3o7VtXmxUwB0=
Authentication-Results: myt5-36442628f0be.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt5-89cdf5c4a3a5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id CEcoqGrAjH-w2Pi2oOt; Wed, 15 Dec 2021 10:58:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 15 Dec 2021 10:57:59 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, Nikita Shubin <n.shubin@yadro.com>, Bin Meng
 <bin.meng@windriver.com>, qemu-devel@nongnu.org, Alistair Francis
 <alistair.francis@wdc.com>, atishp@atishpatra.org, Palmer Dabbelt
 <palmer@dabbelt.com>
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
Message-ID: <20211215105759.011995e7@redslave.neermore.group>
In-Reply-To: <b165ef0f-3336-f4e5-61ee-b3d8cf9e02c0@linaro.org>
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
 <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
 <b165ef0f-3336-f4e5-61ee-b3d8cf9e02c0@linaro.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.140.190.195;
 envelope-from=nikita.shubin@maquefel.me; helo=forward500o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 07:58:17 -0000

Hello Richard!

On Tue, 14 Dec 2021 13:13:57 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 12/14/21 1:12 PM, Richard Henderson wrote:
> > On 12/14/21 1:26 AM, Nikita Shubin wrote: =20
> >> -=C2=A0=C2=A0=C2=A0 if (!pmp_get_num_rules(env) && (prev_priv !=3D PRV=
_M)) {
> >> +=C2=A0=C2=A0=C2=A0 if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !pmp_get_num_rules(env) &&=
 (prev_priv !=3D PRV_M)) { =20
> >=20
> > When would the number of rules become non-zero with PMP disabled?
> > When does this test make a difference? =20
>=20
> Oh, nevermind, I see what you mean.
>=20

Np, let me explain in details:

The ISA states:
> Platforms vary widely in demands for physical memory protection, and
> some platforms may provide other PMP structures in addition to or
> instead of the scheme described in this section.

So we might don't have PMP at all, but if we set

qdev_prop_set_bit(DEVICE(obj), "pmp", false);

for some CPU we still end up in illegal inst on mret, cause we get
pmp_get_num_rules(env) =3D=3D 0, becouse we have no PMP which leads to zero
available rules.


>=20
> r~
>=20


