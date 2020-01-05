Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1io9RD-00082s-Aj
	for mharc-qemu-riscv@gnu.org; Sun, 05 Jan 2020 12:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aurelien@aurel32.net>) id 1io9FL-0007Ls-9a
 for qemu-riscv@nongnu.org; Sun, 05 Jan 2020 11:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aurelien@aurel32.net>) id 1io9FJ-0002H7-Tq
 for qemu-riscv@nongnu.org; Sun, 05 Jan 2020 11:59:23 -0500
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:37822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aurelien@aurel32.net>)
 id 1io9FH-0002Ev-Cd; Sun, 05 Jan 2020 11:59:19 -0500
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1io9FE-0005bk-ST; Sun, 05 Jan 2020 17:59:16 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
 (envelope-from <aurelien@aurel32.net>)
 id 1io9FE-007hSH-Dn; Sun, 05 Jan 2020 17:59:16 +0100
Date: Sun, 5 Jan 2020 17:59:16 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: Re: [Qemu-devel] [PATCH v4 3/7] target/riscv: Create function to
 test if FP is enabled
Message-ID: <20200105165916.GA1834646@aurel32.net>
References: <cover.1566573576.git.alistair.francis@wdc.com>
 <5cc26abb98a9534720f09674b4b9caafb8f2cf0a.1566573576.git.alistair.francis@wdc.com>
 <20200105163640.GA1752551@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200105163640.GA1752551@aurel32.net>
User-Agent: Mutt/1.13.2 (2019-12-18)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:bc8:30d7:100::1
X-Mailman-Approved-At: Sun, 05 Jan 2020 12:11:36 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jan 2020 16:59:24 -0000

On 2020-01-05 17:36, Aurelien Jarno wrote:
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index e0d4586760..2789215b5e 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
>=20
> [ snip=A0]
>=20
> > @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int cs=
rno, target_ulong val)
> >  {
> >      target_ulong mstatus =3D env->mstatus;
> >      target_ulong mask =3D 0;
> > +    int dirty;
> > =20
> >      /* flush tlb on mstatus fields that affect VM */
> >      if (env->priv_ver <=3D PRIV_VERSION_1_09_1) {
> > @@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int cs=
rno, target_ulong val)
> > =20
> >      mstatus =3D (mstatus & ~mask) | (val & mask);
> > =20
> > -    int dirty =3D ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS) |
> > -                ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
> > +    dirty =3D (riscv_cpu_fp_enabled(env) &&
> > +             ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS)) |
> > +            ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
> >      mstatus =3D set_field(mstatus, MSTATUS_SD, dirty);
> >      env->mstatus =3D mstatus;
>=20
> This patch, and more precisely the above two hunks broke
> qemu-system-riscv64. More precisely, when running a Debian sid system
> inside QEMU, sshd hangs during key exchange.

The problem is that at this stage, mstatus !=3D env->status. Prior to that
patch, dirty was computed exclusively on the new mstatus status, after
the update by val. With this patch, riscv_cpu_fp_enabled() refers to the
old value of mstatus. Therefore when FS is changed from "Off" (FS =3D 00)
to "Dirty" (FS =3D=3D 11), the SD bit is not set.

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

