Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1krKQB-0000ow-IQ
	for mharc-qemu-riscv@gnu.org; Mon, 21 Dec 2020 07:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <local.tourist.kiev@gmail.com>)
 id 1krKQ9-0000on-HX
 for Qemu-riscv@nongnu.org; Mon, 21 Dec 2020 07:36:13 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <local.tourist.kiev@gmail.com>)
 id 1krKQ7-0004Og-FT
 for Qemu-riscv@nongnu.org; Mon, 21 Dec 2020 07:36:13 -0500
Received: by mail-lf1-x134.google.com with SMTP id b26so13743420lff.9
 for <Qemu-riscv@nongnu.org>; Mon, 21 Dec 2020 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=y2VuxIufta//COkZouv7AjslWA/3R6J9klhyvlspvXs=;
 b=lm3Bn7X0IjO1FUtBvfzvjjd4WsHyNYcjN+gIc7w+Mcgosr2qzwW1DpTuXKzeaz/QTE
 3PMFJIQskZmMQTa0tG0G3oZIvdlhxD76OIGIz9UkftJmZMQZ/Kfg9J3wU1XQuBhoefKq
 oGES8PBMmWjG6SywcPUAsGPKexMZ4qjuPYV+krtqMFmMJikCkrK1AEzqEQjDDyNvEDPy
 74CQzgVfUf4uWG8IT/S8YXPphNjKut7E3qIkza1IpMpAq31y/V38dPCxYlDyJ00n2Ltg
 7aZrlysqXKp3gOaL8vQ5luo6LPGdjnAotYe2Ft3Z9Q/zy+8YC4Lo0ENJeInJKDhwdqXM
 lseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=y2VuxIufta//COkZouv7AjslWA/3R6J9klhyvlspvXs=;
 b=dyEwPL8NjC9RG1RYZL7q3/TSADJDznlKOJzpDFl9/iZu9mpIYQQ6UNqPAYm8h99NW3
 /KzJDCZbvogNJwgBe3BwXC7k1egnXHyMz8Ff3ZEq+uEqX9akY3+4fNukLTikzopRxHLT
 J6hBu/D3EZNygsyKS0IxL/D9Yqny/OAG5CRPlVzE5XM/Z8zCI6bMnhjZlIB5thzmyPQL
 KMRZ9eFO3rEKitFRRKZQv+dQb+SNKUeE9cz8sR++/o2xnDgWFMRhEtThiRM14PXE3MXk
 kZTQT1iCyEFQVPzBvjFCWT6GUneVrDzdnSG3HloRODXB+KM9rHOd9EvaljLAYeUV6sL4
 4reg==
X-Gm-Message-State: AOAM530InK+k6UrzGbt3as5VG75OcNsPKz5bL5g1NYZ5ZOHlmSJTU6zz
 rdKniJXdKasMz1kmRklGKRI2xy4VCu2B3oNMBJ2aYNG2xq9Ylw==
X-Google-Smtp-Source: ABdhPJxXclZPZ16nj+Pa23ABDP8+cN/kss2ho1m25WvtKddh9uOWaooHqIxXrTD2FXzFtLLtAIh0+cWu0IZervx30VE=
X-Received: by 2002:a19:651a:: with SMTP id z26mr6418849lfb.306.1608554167687; 
 Mon, 21 Dec 2020 04:36:07 -0800 (PST)
MIME-Version: 1.0
From: Ivan Serdyuk <local.tourist.kiev@gmail.com>
Date: Mon, 21 Dec 2020 14:35:55 +0200
Message-ID: <CANFCsz82ELUcs9Q6PVvmAE0rcx5NB13Sf1xfzf7AC9dQ-z74Fg@mail.gmail.com>
Subject: Guaranteed way to identify whether an application is running under
 qemu-linux-user + nspawn (JeOS)
To: Qemu-riscv@nongnu.org, adrian@suse.de, schwab@suse.de
Content-Type: multipart/alternative; boundary="000000000000c45f1505b6f8b3f3"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=local.tourist.kiev@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 21 Dec 2020 12:36:13 -0000

--000000000000c45f1505b6f8b3f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there.

I was trying to figure out a proper way to identify whether an application
is running under rv64gc build of JeOS (currently using
https://en.opensuse.org/openSUSE:RISC-V - but I could try other "container
OS" builds, as well).

There is an open issue, for Bazel, out here
<https://github.com/bazelbuild/bazel/issues/12683> - so I might be able to
submit a patch, for supporting such an environment.

I am stuck on finding a proper way to identify that I am running something
under qemu-linux-user : checking /proc/cpuinfo would provide the info about
my host OS (OpenSUSE), not the JeOS.

Please advise something concrete.

CC'ing to Andreas Schwab and Adrian Schr=C3=B6ter.

Thanks in advance.
Ivan

--000000000000c45f1505b6f8b3f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there.<div><br></div><div>I was trying to figure out a =
proper way to identify whether an application is running under rv64gc build=
 of JeOS (currently using=C2=A0<a href=3D"https://en.opensuse.org/openSUSE:=
RISC-V">https://en.opensuse.org/openSUSE:RISC-V</a>=C2=A0- but I could try =
other &quot;container OS&quot; builds, as well).</div><div><br></div><div>T=
here is an open issue, for Bazel, <a href=3D"https://github.com/bazelbuild/=
bazel/issues/12683">out here</a>=C2=A0- so I might be able to submit a patc=
h, for supporting such an environment.</div><div><br></div><div>I am stuck =
on finding a proper way to identify that I am running something under qemu-=
linux-user : checking /proc/cpuinfo would provide the info about my host OS=
 (OpenSUSE), not the JeOS.</div><div><br></div><div>Please advise something=
 concrete.</div><div><br></div><div>CC&#39;ing to=C2=A0Andreas Schwab and=
=C2=A0Adrian Schr=C3=B6ter.</div><div><br></div><div>Thanks in advance.</di=
v><div>Ivan</div></div>

--000000000000c45f1505b6f8b3f3--

