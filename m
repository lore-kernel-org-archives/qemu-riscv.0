Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPHB2-0007b3-J1
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 00:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zazad@bu.edu>) id 1mPHAw-0007ZT-2q
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 00:33:06 -0400
Received: from relay72.bu.edu ([128.197.228.172]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zazad@bu.edu>) id 1mPHAu-00057O-MW
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 00:33:05 -0400
X-Envelope-From: zazad@bu.edu
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 by relay72.bu.edu (8.14.3/8.14.3) with ESMTP id 18C4WNKu022729
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 00:32:23 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so2528943wmk.2
 for <qemu-riscv@nongnu.org>; Sat, 11 Sep 2021 21:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OGrkN0OZhxhNNApcIcR6uGhzAAyT8Ewvr9oGvVramps=;
 b=r+kPEa9drEviqM6tbjZN7msdS+rT8cw5R/Qypq7EM7hMJbEpVBsUuHNBbvefiZ0HIv
 22rpYszsCJUJFh3I9Ih19hfe35+1NESvKIOmSfe8vU6ZpLpI106a0LSqEPSFeZrSBro/
 axNNz8oSJLm/rN5zmAbanx1ZXfHb6x4F5jC641dhfwQFM2Xp3bf9+2LFcUTP7JiJTUWJ
 tT0wKkoARmhfuprd4si31j0ax/z5vYx341gVosiRcW73k+PeKrkkKdiwDBpawsZ/8DNF
 2t3edgy3Z7q/Ie50iw+3UnmUjDvoCMi5VSTHx13lpDbmU5yybSgKe7sFhzjgDpExBtML
 wlrw==
X-Gm-Message-State: AOAM5311okEhQ26SOuFdC8Oo/mMW/ebAt2i+tKiBpMjBCdKn8uUEHd2A
 SKQ0dLdahV1e7nbdJleASMwr8NHYj53WnFn+C1gbwfzoQDnbbDoOSPBwx25JNj2IFOvWPhihqPh
 jqb0RdsUDfSkFvkwjijSOERcHjUrL7m3u
X-Received: by 2002:adf:b741:: with SMTP id n1mr5777983wre.120.1631421143129; 
 Sat, 11 Sep 2021 21:32:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHzhUYLW3Ns3mn7JrMoqQOL8nFSHMRRIWN4N7pPNXY+9Cw+c2HJxV6FydHkPfhXjXTZHa0w32Hg111jlVnSqM=
X-Received: by 2002:adf:b741:: with SMTP id n1mr5777967wre.120.1631421142743; 
 Sat, 11 Sep 2021 21:32:22 -0700 (PDT)
MIME-Version: 1.0
From: Zahra Azad <zazad@bu.edu>
Date: Sun, 12 Sep 2021 00:32:12 -0400
Message-ID: <CAKP3tdRSYSfyTPeBk2+WYaUxt1jApK6XXYjXyZw4JwTxfTackQ@mail.gmail.com>
Subject: Question about riscv-qemu trace
To: qemu-riscv@nongnu.org, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b1597005cbc4d55e"
Received-SPF: pass client-ip=128.197.228.172; envelope-from=zazad@bu.edu;
 helo=relay72.bu.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 12 Sep 2021 04:33:07 -0000

--000000000000b1597005cbc4d55e
Content-Type: text/plain; charset="UTF-8"

Hi all,

I want to use riscv-qemu to get a trace of the guest executed instructions
of a vectorized program. I'm using the following command:
qemu-riscv64 -cpu rv64,x-v=true,x-k=true,vlen=256,elen=64,vext_spec=v1.0 -D
logfile.log -d in_asm,cpu,fpu program

Although the program is executed correctly without throwing any error, in
the trace log all the vector instructions are shown as illegal
instructions. Any ideas what is going wrong?

I built riscv toolchain and llvm from the main branch (following sifive
instructions <https://github.com/sifive/riscv-llvm>), and riscv qemu is
built from https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh.

Thank you!

--000000000000b1597005cbc4d55e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><div>I want to use ri=
scv-qemu to get a trace of the guest executed instructions of a vectorized =
program. I&#39;m using the following command:</div><div>qemu-riscv64 -cpu r=
v64,x-v=3Dtrue,x-k=3Dtrue,vlen=3D256,elen=3D64,vext_spec=3Dv1.0 -D logfile.=
log -d in_asm,cpu,fpu program <br></div><div><br></div>Although the program=
 is executed correctly without throwing any error, in the trace log all the=
 vector instructions are shown as illegal instructions. Any ideas what is g=
oing wrong?<br><br><div>I built riscv toolchain and llvm from the main bran=
ch (<a href=3D"https://github.com/sifive/riscv-llvm">following sifive instr=
uctions</a>), and riscv qemu is built from <a href=3D"https://github.com/si=
five/qemu/tree/v5.2.0-rvv-rvb-zfh">https://github.com/sifive/qemu/tree/v5.2=
.0-rvv-rvb-zfh</a>.</div><div><br></div><div>Thank you!<br></div></div>

--000000000000b1597005cbc4d55e--

