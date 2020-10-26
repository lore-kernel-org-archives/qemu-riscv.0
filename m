Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX9vM-0001Kt-P7
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 17:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kX9vH-0001HU-RL; Mon, 26 Oct 2020 17:20:59 -0400
Received: from home.keithp.com ([63.227.221.253]:57048 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kX9vE-0007ru-Qm; Mon, 26 Oct 2020 17:20:59 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 8CB7D3F2DD61;
 Mon, 26 Oct 2020 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603747253; bh=IQUHrFXKJLaQlnApe4q47g7/mOk6S1Ckw1cgJjvGIf8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G7AofQgODUbr6d7gEj8ghXTsZTmKSzSu5cymCUOvBVU4vDbZtSe5B9DAy2E3yiWRO
 79uuvcmFBNAP+06L0kcfw+sVCnu3NnHrXGhYfR0J9eFuza30Oa1VhjVp2zamzLKfvj
 p3teCUCY5OMhKK35E4PqZ6Huwv0P01SiUv7Q4K1M8i3OqUujEvQkfRhMQOeR76WoJG
 CZHt+5pmV0bLQ9RSlkYhA5oFdMOJQNMCpE/P5qITQeb6xJdsx9USy1S0DNURLj+mqV
 jRi60A6hrawLPl+Y+YMKbsSPrjGM/Ba4TXhvzJ+J7dTbtG5yrU62sl7xtz003SpE1k
 VUO5FGid6nBFQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ep3decOYF6mE; Mon, 26 Oct 2020 14:20:53 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 247673F2DD60;
 Mon, 26 Oct 2020 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603747253; bh=IQUHrFXKJLaQlnApe4q47g7/mOk6S1Ckw1cgJjvGIf8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G7AofQgODUbr6d7gEj8ghXTsZTmKSzSu5cymCUOvBVU4vDbZtSe5B9DAy2E3yiWRO
 79uuvcmFBNAP+06L0kcfw+sVCnu3NnHrXGhYfR0J9eFuza30Oa1VhjVp2zamzLKfvj
 p3teCUCY5OMhKK35E4PqZ6Huwv0P01SiUv7Q4K1M8i3OqUujEvQkfRhMQOeR76WoJG
 CZHt+5pmV0bLQ9RSlkYhA5oFdMOJQNMCpE/P5qITQeb6xJdsx9USy1S0DNURLj+mqV
 jRi60A6hrawLPl+Y+YMKbsSPrjGM/Ba4TXhvzJ+J7dTbtG5yrU62sl7xtz003SpE1k
 VUO5FGid6nBFQ==
Received: by keithp.com (Postfix, from userid 1000)
 id E16411582210; Mon, 26 Oct 2020 14:20:52 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
In-Reply-To: <4faf9e1f-45bd-9f47-8a5f-be7b6fcdf540@linaro.org>
References: <20201023214940.917885-1-keithp@keithp.com>
 <4faf9e1f-45bd-9f47-8a5f-be7b6fcdf540@linaro.org>
Date: Mon, 26 Oct 2020 14:20:52 -0700
Message-ID: <87zh48fzuz.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 17:06:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 26 Oct 2020 21:21:01 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/23/20 2:49 PM, Keith Packard via wrote:
>>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>>  {
>> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
>> +    uint32_t pre    =3D opcode_at(&ctx->base, ctx->base.pc_next - 4);
>> +    uint32_t ebreak =3D opcode_at(&ctx->base, ctx->base.pc_next);
>> +    uint32_t post   =3D opcode_at(&ctx->base, ctx->base.pc_next + 4);
>
> Alistair asked if this approach is ok.  I think it is.  There are other p=
laces
> in which we scan forward (usually only forward, not backward, but this is=
 a
> special nop, so it doesn't matter).
>
> However:
>
> (1) No need to re-read the current ebreak insn.  That is how we arrived h=
ere,
> after all.

The semihosting spec requires that we land here using a 32-bit ebreak
instruction, not the compressed version, so I think we still need to
check for this.

> (2) You need to check for page boundaries before reading pre and post.
> Otherwise you could wind up with SIGSEGV (or the equivalent internal qemu
> exception) when you shouldn't.

Right, in that case the ebreak instruction should just raise a regular
break point exception. I've added a check to make sure the address of
the three functions match when and-ed with TARGET_PAGE_MASK.

I've finished re-working this patch into a series which first modifies
the ARM semihosting support to be architecture-independent, then adds
the changes necessary to support RISC-V. Expect to see that series on
the list shortly.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+XPbQACgkQ2yIaaQAA
ABHB0w//TcQubFd20vRnOTuVj4h8vOPLJJfy0/6Z7804eCGrlefBrjp3DkmofgHs
V0d8+E+ZXguxTKJi3xyeMhl2GAP8E8ulOtNYblTjQ3NH9+hx3oUZsf23MouAfKyh
2WLKelFOM32SiX52Ll7BR5Wb+jWztd4sUfg9Kq6MIL3FujWVXZrZ+OIWvDTaJtBl
YSUgKIX6C988za4qMzNCmjizlkqo4JxEt8aYzid3xLdX/4fJz7Yn4qF9gTD0G5/7
6Ny3V4x0vmWoqz4hqoXmndpgV4LJV7KGvf1vJbS7dZ5Xh0KW+vu+to0Xr3su53pG
jN9zOl7HVuFOWcsD1PMZAGdBvNuYdaIEtvncFTtDD1wgKS5s3oYXOrWNIt5te8RT
wuXBYUMCscnV7oTdt9yeJOyUSInMNrC8K5vt0khQr/KGe2hMs1URr164Wu4yNWuo
eRICAZRmJCYzql8EAcKxFwBmid657BtmhMBXgrZBuIc5AtRit1grP/puars70VZ5
jGlEmPRU9XcbihtIPDM7Y4L1xNbgBqTC9g64P5K24rryyYMFjGOXHGZqli+IYZm8
bftEmh3IBIAdbepfkkx4F9LgZ8EnksnCBt566bO3T36wnscuIaT13bcM5xaoKNFx
vS6zzlLNfcbLsO8ZUpm0xJ9CrS4//hBtEjiVKI4XbE9SabN0v7I=
=Cbg1
-----END PGP SIGNATURE-----
--=-=-=--

