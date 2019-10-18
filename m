Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLX6S-0004nt-Vy
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 14:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iLX6Q-0004jk-M8
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iLX6O-0003OA-M3
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:35:53 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iLX6O-0003My-GF
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:35:52 -0400
Received: by mail-pf1-x442.google.com with SMTP id y22so4401339pfr.3
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=J5NHhj92JqRcZSqlpsHIP0+hdLynWn5d3wktBBmpCYg=;
 b=QTGK7ZDdXIs7cxJFi5s9ixZUuS/B+ZNhUpfFbg7PW/qczPNWT9RrWS+MG0N6+s4Gas
 UjP97+i1MgYommZbR9TO5sYBHQCi3dBUYUegVWZPascI0u+Sd0I6T1zvh8sp5FaKO+oM
 RDt7M5XaHf6/Fw6tU3FwdRj140qFJk+zQZimKD/4HOlSLSIH9Hm8yz+YbC4lKQxkr4aN
 Z5UZ0KOCyIdeX8AD25ZMzTEUaRtpHtz2zb3+JfvDKHrpr/nq4/32D7CpZgKdaYzxNLxf
 8dPwzFQ1gI7BWvvh97d9uqpUfNJ4TzFEDLAP7x8cmBF9j8a5WA1YYOEB3cZmS+2oSM+S
 gbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=J5NHhj92JqRcZSqlpsHIP0+hdLynWn5d3wktBBmpCYg=;
 b=OKQhv7V8gT80IrwFREbfUCXdHGDTKce68C6pijEYxB6bbGzxq5/0NYmrTl0f2VL/Nc
 7cA7p9znsKWYNKDLmU9SrZvemCxc7Bug1RSFLCi8oan0Gf9UUNz2TjcvT1tIXDz9eist
 oyyQf+y1igvcqS94NnG6YCLZS944Zqjz836C8i0Ae/DFyeXfHSrzMdfHxiQpejNV6fQu
 cA8cu6/doBZNS3lYpN4BaZIzm+R3cd3pIJ/B0HbWGzz4qNTbDbds7UUhd9vWTmenrdTa
 lKTeGOlTJpbOSuRYBXkBdvxcXMGtGNQqIfqg2wy0+0pVtOPOhC/YxfVKUjQdEdZA9TQQ
 tOqg==
X-Gm-Message-State: APjAAAUJjtD+p+zQLF9tg9IherPjtfFzY/3P/k6fVRsLJzskhBRFfOoi
 RRojWhViSoT5LzJ/W+3PDG58HA==
X-Google-Smtp-Source: APXvYqzOR7+oMOgBS+Yxzp5UOu5HBeaQ4tE+v6HcO+GgBkQbGv28ynTZSLqWESLfJoEMWRch7VqdoQ==
X-Received: by 2002:a63:5064:: with SMTP id q36mr11357638pgl.393.1571423750491; 
 Fri, 18 Oct 2019 11:35:50 -0700 (PDT)
Received: from localhost ([152.179.112.46])
 by smtp.gmail.com with ESMTPSA id o42sm6170313pjo.32.2019.10.18.11.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:35:49 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:35:49 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2019 11:35:29 PDT (-0700)
Subject: Re: [PATCH v4 0/3] target/riscv: Expose "priv" register for GDB
In-Reply-To: <20191014154529.287048-1-jonathan@fintelia.io>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: jonathan@fintelia.io
Message-ID: <mhng-734b54c4-1d13-4fe2-8ded-bec866ecf2f0@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Fri, 18 Oct 2019 18:35:56 -0000

On Mon, 14 Oct 2019 08:45:26 PDT (-0700), jonathan@fintelia.io wrote:
>
> This series adds a new "priv" virtual register that reports the current
> privilege mode. This is helpful for debugging purposes because that information
> is not actually available in any of the real CSRs.
>
> The third patch in this series makes the priv virtual register writitable. I'm
> not entirely sure this is a good idea, so I split it out into its own patch. In
> particular, this change will conflict with the hypervisor extension work which
> assumes that the privilege mode does not change in unexpected cases.
>
> As pointed out in a previous version of this series, GDB actually contains some
> support already for the accessing the privilege mode via a virtual "priv"
> register, including to convert the values into human readable forms:
>
> (gdb) info reg priv
> priv           0x3      prv:3 [Machine]
>
> Changlog V4:
> - Fix typo in filename
>
> Changlog V3:
> - Break patch into series
> - Make priv a virtual register
>
> Changelog V2:
> - Use PRV_H and PRV_S instead of integer literals
>
> Jonathan Behrens (3)
>   target/riscv: Tell gdbstub the correct number of CSRs
>   target/riscv: Expose priv register for GDB for reads
>   target/riscv: Make the priv register writable by GDB
>
>  configure                       |  4 ++--
>  gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
>  gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
>  target/riscv/gdbstub.c          | 36 ++++++++++++++++++++++++++++++++++--
>  4 files changed, 58 insertions(+), 4 deletions(-)

Thanks.  I've taken these into my patch queue, which I hope to submit soon!

