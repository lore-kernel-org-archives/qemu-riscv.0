Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQZcT-00033t-W3
	for mharc-qemu-riscv@gnu.org; Fri, 01 Nov 2019 12:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iQZcR-00031a-DI
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iQZcP-0005oK-Sv
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34013)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iQZcP-0005jq-MO
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e4so6801793pgs.1
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2019 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=agZSirPRdMoHVC3gCYphFvJ6jy/o+BLQv3H5zsgQARE=;
 b=fNPNtgSU1pPgW5CT98KHMktgOzlrHf2UCNCgRkrlsm0Pw7MOvEnQI0jJjI8TXzmTVN
 AlLVvIvPN9saL8fYFI0Tb/GDFmqaGsCpFJVGtdQSvCuI0/cR7LRlDo/qXMtLGb1S+U4F
 frUDTjiw3KUsW/ugSkUlJlFJzntUsU7AP3g8v8zMdR1FLca9IO1UtJCLZIo/+BrFCpDx
 6SIwVbYyYRrqCbiNwsl+yypXoF70JoOcJy66isb1P0PLE1Ufqpu7ZHdiHGr2zYfwd4Ao
 oMnzIJzDZnQwHfIo4Kg8jEYHrYAOOpcN/HKq0F9SuxpZbf9arjO0/n7ykdI6s/cA5uEN
 2DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=agZSirPRdMoHVC3gCYphFvJ6jy/o+BLQv3H5zsgQARE=;
 b=PqPnrh1amQgNoCvhOlLzFo8bol6l/AVCpuKuZL/EBE4uZSP9lAPWkS4M5TgZ67e9b0
 WC/ON/5NTVDgTrU+phSOAcm1HVjEpPbSkwZBkbGKuGUZmk2bVRSrPBL/L8eCpMfI8+oj
 IC+uYO0AQw124E65uvmLWL+vEsUzMUS4PTxnMTrEGZZjAV/GA9KEr72dDeEf2Trl/gtg
 7TQgEQj4nk/Kd1vrhzhsfW3S+kXIVt06Lr3xEOhYmspVaCTCEpGX3HNcYpfotsK35rtW
 eNYZU8p5GKiXFZc9bEK2yHU8ASOwbw1Le2hRPDS1RcBfHws0IBP/l7PwzTOhkSlwB5wH
 RWvg==
X-Gm-Message-State: APjAAAXYJpwP5SG4VsdQjPG2O0/YER0NYv7qYgTrhMMBZYGnxKYadvOo
 JpUtfxurvpdflsej3SvHexscMw==
X-Google-Smtp-Source: APXvYqydVJhG32ZGjWrO5icIbBzeaB7SEDOW8Orm4FOd8oB2sFmo4bAwS9PZ+67OQ0wpO9dh4Z/Pog==
X-Received: by 2002:a63:d651:: with SMTP id d17mr14969909pgj.106.1572625064062; 
 Fri, 01 Nov 2019 09:17:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o1sm7404270pgm.1.2019.11.01.09.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 09:17:42 -0700 (PDT)
Subject: [PULL] Update my MAINTAINERS file entry
Date: Fri,  1 Nov 2019 09:16:53 -0700
Message-Id: <20191101161654.2871-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52b
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
X-List-Received-Date: Fri, 01 Nov 2019 16:17:48 -0000

The following changes since commit b7c9a7f353c0e260519bf735ff0d4aa01e72784b:

  Merge remote-tracking branch 'remotes/jnsnow/tags/ide-pull-request' into staging (2019-10-31 15:57:30 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/palmer-for-master-4.2-sf1

for you to fetch changes up to c1677bcc395eb977cc7279a1af0a1d23ad23fdd4:

  MAINTAINERS: Change to my personal email address (2019-11-01 09:13:30 -0700)

----------------------------------------------------------------
Update my MAINTAINERS file entry

This contains a single patch to change my email address.

----------------------------------------------------------------
Palmer Dabbelt (1):
      MAINTAINERS: Change to my personal email address

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


