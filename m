Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFdKI-0005sk-Ps
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 08:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nagakamira@gmail.com>) id 1iFdKE-0005rH-W0
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 08:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nagakamira@gmail.com>) id 1iFdKE-000557-2S
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 08:01:46 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nagakamira@gmail.com>)
 id 1iFdKD-00054p-UV
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 08:01:46 -0400
Received: by mail-io1-xd2d.google.com with SMTP id q1so56261742ion.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2019 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KYd0mJJfp4EmMON3AMPkZNNr61V5a7Hm/Tw1qc4CyGU=;
 b=FXPzcaRlCu+0cRJyClRwZIb+pxQxtR0LLDi2fne1bcesWFOTw2UoBUxfkWkwWobzpA
 9o1TmJ/xrh50wNouDqi7gd2xS+iosXs/VK5gRhej1CsHxuuyaJxU9X4qWGxx67vVa7uK
 OgSfKU2QYmXPwKyRwHRc7L9e7zGopb7SctLaNOxtwG6YGmQYXalRuSpsIS1bY5/WVFRE
 lu5ien95DUJRoBRsLCbkyUqhgSNaZ09F9zpk1Kifz38nIEMoPCO1/3rozhY7Inj4+5qZ
 bbL6dw+6kqxheQdworvwTxLfY95GSCKBXJGdwtquu1Zi/0+70dYiYEceNncRZb//MBuE
 e8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KYd0mJJfp4EmMON3AMPkZNNr61V5a7Hm/Tw1qc4CyGU=;
 b=J/vaCkwvu15UoOUi2dsldKmn71I2ZPDIvuXFJWy1lmDo3fjmhlK2i8mu/QxxnK6usq
 NZC2ZEyPpXNq8vcP7tEW5EisXw4RjIUvq08nJCdK1bn2V/gNf+yiPj4O+FcgjZaeMUxP
 /OMaTn8EMuNkylOiROuSt1N9p94qccsty08u4+CDFIg7vxcjHqp6LUoUbkxygKIZ4p7/
 j23IFHf5rNOlVp7tbGThum6BUxJvSyZ0SMtQiEQUYTGIio8nGejKuvS3TvhjeWgAoSD9
 XoDb2IfX0NunXEObqU4sD+vtLcN7SIy16NZ4ys2cbP4N/dvE9DmkbYRrOp3uLDmDa6x9
 K5LQ==
X-Gm-Message-State: APjAAAXlIsH3xIu8jtZeZYnyKF8+/bqgL24AA7CZ5NVWmn3vXB78CQ3U
 eokpqkhBMwQ/luXy+MKEArHimgzi+puz7J+SrsFaow==
X-Google-Smtp-Source: APXvYqzmJuaV8vSqBYbg8s1DKpFBAfUYYCrfg2cvXjE32nPDxdY6a3NtFPmYspOep6t+ZgU0eBSeWwh4M8v6osmqLPM=
X-Received: by 2002:a92:1b49:: with SMTP id b70mr150696ilb.139.1570017705030; 
 Wed, 02 Oct 2019 05:01:45 -0700 (PDT)
MIME-Version: 1.0
From: Nagakamira <nagakamira@gmail.com>
Date: Wed, 2 Oct 2019 15:01:33 +0300
Message-ID: <CAEqUM+eiCKbKEYHjmRHr+8Oj-azvCNFvpJVe7Jn4m7iWnDrFbA@mail.gmail.com>
Subject: RISC-V and VGA
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000997bea0593ec3bf1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2d
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
X-List-Received-Date: Wed, 02 Oct 2019 12:01:48 -0000

--000000000000997bea0593ec3bf1
Content-Type: text/plain; charset="UTF-8"

Hi, I'm using qemu for operating systems development. I wanted to test
wayland stuff in qemu for risc v but there's not vga output. I tried
virtio-vga and it doesn't work. I tried to use virtio gpu but it didn't
give me access to tty. Any suggestions?

--000000000000997bea0593ec3bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto"><div style=3D"width:328px;margin:16px 0px"><div><div dir=3D"auto=
">Hi, I&#39;m using qemu for operating systems development. I wanted to tes=
t wayland stuff in qemu for risc v but there&#39;s not vga output. I tried =
virtio-vga and it doesn&#39;t work. I tried to use virtio gpu but it didn&#=
39;t give me access to tty. Any suggestions?</div></div></div><div style=3D=
"height:0px"></div></div><br></div>

--000000000000997bea0593ec3bf1--

