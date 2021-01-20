Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2JqU-0002Ja-7L
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jan 2021 15:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l2JqS-0002Iw-Br; Wed, 20 Jan 2021 15:12:48 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:50598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l2JqP-0000sl-SD; Wed, 20 Jan 2021 15:12:47 -0500
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
Date: Wed, 20 Jan 2021 22:12:30 +0200
Message-ID: <24791910.1r3eYUQgxm@farino>
Organization: Gentoo Linux
In-Reply-To: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2121804.vFx2qVVIhK";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 20 Jan 2021 20:12:48 -0000

--nextPart2121804.vFx2qVVIhK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
Date: Wed, 20 Jan 2021 22:12:30 +0200
Message-ID: <24791910.1r3eYUQgxm@farino>
Organization: Gentoo Linux
In-Reply-To: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>

>=20
> This patch just passes the waitid status directly back to the guest.
>=20

This works at least as well as the previous versions, so ++ from me.=20

Will do more testing over the next days to see if it maybe also improves th=
e=20
additional oddities I observed.=20

Tested-by: Andreas K. H=FCttel <dilfridge@gentoo.org>

> Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Set tinfo->_sifields._sigchld._status directly from status
>=20
>  linux-user/signal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73de934c65..7eecec46c4 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -349,8 +349,7 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo, case TARGET_SIGCHL=
D:
>              tinfo->_sifields._sigchld._pid =3D info->si_pid;
>              tinfo->_sifields._sigchld._uid =3D info->si_uid;
> -            tinfo->_sifields._sigchld._status
> -                =3D host_to_target_waitstatus(info->si_status);
> +            tinfo->_sifields._sigchld._status =3D info->si_status;
>              tinfo->_sifields._sigchld._utime =3D info->si_utime;
>              tinfo->_sifields._sigchld._stime =3D info->si_stime;
>              si_type =3D QEMU_SI_CHLD;


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)
--nextPart2121804.vFx2qVVIhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE2dlecvcVU8/ThuQ/jJJgxvbXoxAFAmAIjq5fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEQ5
RDk1RTcyRjcxNTUzQ0ZEMzg2RTQzRjhDOTI2MEM2RjZEN0EzMTAACgkQjJJgxvbX
oxAxxw/9E9WgiClIYDNkCmjTIzotTDVGsExyrwPxlmQHjLJRzuAY0vCyCFMv0TvK
fWqq6yhu45k6uTQa1l2osXBwefITW7QD4l86YTqMJ8Fb2jJVZp8AM4LiXlNnnrMl
ublFjHxPbV6FsnKZbM5+JgzL5eJbPvDj6B26+XqBjIFIqSZwAwN9vZr8vYb2sIO7
k0aDWKSv1SoKa8ks+S09P7IS1NlPNquSWy0A3QjO5CGRuNSxMiUJXJ4AXFCJFYiA
jGyoiONcccforO4OH5AuoCCaoNeMyDGpiluMUoGPsbHf44G6/IBWyy260NEfbcZT
miXwl8AsVwBrajx/ftM/Ob4xHEBtzi4WCHzTvOZOFW5SYkICI+xZJ8YRrX3hmg6s
kJ5BSOTOuYjsboWFBZZ6dDKecSpvqvqBhKg65NrvpvZSptYOaNI/V/Riny2fBnqa
WTy4WLvpzCAM7aKuV0QBgMbzifRPhbTJ0d6idJTL/S8fEw/bYDOy5WFF4yBsQ9UR
wrlKSyhUOOxESun7efMczsgeZoOYvNVXgjuu5Iq0SHXMMtsXo3jy5t0ubPGcxxfY
qvWYpRSQnC232/dCCd/mrEP9vl3nlax/ja7yMf4EV2dBxlIWRgNrBR/gG2rmYXPx
k8wY0TPE8oBLMBS8VlRqAmBb7Cz2QaCALSAkOKS5ddlxsMSdPsw=
=/jUu
-----END PGP SIGNATURE-----

--nextPart2121804.vFx2qVVIhK--




