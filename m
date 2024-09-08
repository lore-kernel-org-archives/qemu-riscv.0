Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDED5E6FE49
	for <qemu-riscv@archiver.kernel.org>; Sun,  8 Sep 2024 13:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1snHXz-0004iU-V3; Sun, 08 Sep 2024 09:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.gorecki@wit.edu.pl>)
 id 1snHXx-0004Zo-DG
 for qemu-riscv@nongnu.org; Sun, 08 Sep 2024 09:01:41 -0400
Received: from dervish.wsisiz.edu.pl ([213.135.44.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.gorecki@wit.edu.pl>)
 id 1snHXv-0007o3-6H
 for qemu-riscv@nongnu.org; Sun, 08 Sep 2024 09:01:41 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by dervish.wsisiz.edu.pl (Postfix) with ESMTP id 252F6C54C8B
 for <qemu-riscv@nongnu.org>; Sun,  8 Sep 2024 15:01:32 +0200 (CEST)
X-Virus-Scanned: amavis at wit.edu.pl
Received: from dervish.wsisiz.edu.pl ([127.0.0.1])
 by localhost (dervish.wsisiz.edu.pl [127.0.0.1]) (amavis, port 10024)
 with LMTP id 50jkxXokLq3U for <qemu-riscv@nongnu.org>;
 Sun,  8 Sep 2024 15:01:31 +0200 (CEST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: goreckij)
 by dervish.wsisiz.edu.pl (Postfix) with ESMTPSA id 8938AC54C8F
 for <qemu-riscv@nongnu.org>; Sun,  8 Sep 2024 15:01:31 +0200 (CEST)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d877dab61fso2259673a91.3
 for <qemu-riscv@nongnu.org>; Sun, 08 Sep 2024 06:01:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy7wkyBJuiZVwTV5Iaiu8SU7I/kikcvTG4aQdT3DO+MPCQlplvx
 yKEHdj4PJTd4Rigu3FGjYUIn9LmIF/gPXmkkT8e6mxjbdzepv0LJA64hvUxzznaobjbPiW5JoON
 H9dEqQuQv/PLJU56oSuQ48BsqN8k=
X-Google-Smtp-Source: AGHT+IE4OqF0769MEMgrXFYIFoIwzIkW4r7/Mm6qCjWj2WU9a7Db/4gDhP9jONobRlu0R7lqwvqNwWOirVxOyRjKqtg=
X-Received: by 2002:a17:90a:fe8d:b0:2d8:8175:38c3 with SMTP id
 98e67ed59e1d1-2dad5018d0amr8527023a91.10.1725800491340; Sun, 08 Sep 2024
 06:01:31 -0700 (PDT)
MIME-Version: 1.0
From: Jan Gorecki <j.gorecki@wit.edu.pl>
Date: Sun, 8 Sep 2024 15:01:20 +0200
X-Gmail-Original-Message-ID: <CAOO9MKU7HwG-7xuEZhSs+BBiQn9B3Z4XQvdTW2yw=tqByGsBTQ@mail.gmail.com>
Message-ID: <CAOO9MKU7HwG-7xuEZhSs+BBiQn9B3Z4XQvdTW2yw=tqByGsBTQ@mail.gmail.com>
Subject: Risc-VV 1.0 in QEMU
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003d65a506219b3dc9"
Received-SPF: pass client-ip=213.135.44.54; envelope-from=j.gorecki@wit.edu.pl;
 helo=dervish.wsisiz.edu.pl
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000003d65a506219b3dc9
Content-Type: text/plain; charset="UTF-8"

Hello,

Does QEMU emulation supports Risc-V Vector Instructions 1.0?

If yes
  (then sorry for bothering)
  could I get a quick links to documentation/examples

if no
  is there any ETA on supporting that?

Best Regards,
Jan Gorecki

--0000000000003d65a506219b3dc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Does QEMU emulation supports Ris=
c-V Vector Instructions 1.0?</div><div><br></div><div>If yes</div><div>=C2=
=A0 (then sorry for bothering)</div><div>=C2=A0 could I get a quick links t=
o documentation/examples</div><div><br></div><div>if no</div><div>=C2=A0 is=
 there any ETA on supporting that?</div><div><br></div><div>Best Regards,</=
div><div>Jan Gorecki</div></div>

--0000000000003d65a506219b3dc9--

