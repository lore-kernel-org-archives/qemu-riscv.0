Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHbTp-0008JR-3V
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 17:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTk-0008Dl-GJ
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTj-000687-Ox
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHbTj-00067p-H3
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id 23-v6so6288428pgc.8
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=4I2mnYR2G028736kl1gDSfh5Wt/aTsLmyZ1p7pZCLpE=;
	b=dRJ1nW/2aiuAOKYRlYOEqM7pJH3MGlOCrCV23TNYFO1WLLciL9E7mkv3nJ36h7Jf5G
	zwi9qn2nM3zgI+WwtuqEvanXzUKS1MSG2Qs8g72Fto1SixvFqxAtzopB/2wxi36FyoN6
	5K5+K1/iOS/UmK6B4njtJ16lMbj74tUDlolOZ7THJiYVIw2FzEUZbguzUuYuS4mXQeT6
	3OUJh78eis9DX8aVbyMpfQca8PjUVTdzr2Pokg/d/h3Exw8RdPenHYpJTY1RAsVyy0r9
	kRstfXbgbgqfpQoz/pw9oly9rsgEVV+kCfwA0gVY9UBcDF7KEadkRckqwHAMT2UqyL/F
	fHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=4I2mnYR2G028736kl1gDSfh5Wt/aTsLmyZ1p7pZCLpE=;
	b=fUnmVgXmPEckOon73Ju6XT5GYA6c2IT5KGw+ByglrUT2yJXF9pruC5NA06Ngt6ivtY
	fPLiO6bvP1LSrLqxWPHjuXnV30AdPNnZs1cxJhMAefmJE9VGoIJkH7ur85ri3InuUc+W
	WNIoetYmLhr/aKLG/bN/Dqi+7XUKp3bZMYb7q0OIIGlAVvPJRaBIEOpdHA7SeofkwLnH
	3xe6TXS1b2VUcMVhuh7seloz0v5uEGzkrewHGJnOpHoHL7Fa6+o4T7Gk75xvsMvbzbNG
	1teUTnF5OqzRVjymm0Im3jMUfhBwc6Zp1PAMLCzofeMcwi6bP2Nr3NMSOoLOsmQDHVKy
	8QWQ==
X-Gm-Message-State: AGRZ1gKahE7BG2yANblHCvZNFNuJVzMDlQyhPkmk3xJ8Ro3cHPa64/si
	AWP4kCe3Dbn83SJIIWGurwh0B/GVa/E=
X-Google-Smtp-Source: AJdET5epGlM1ZULhsTgA4zEa2ILw6LkghiZTgO2cBQdscsYTMHQji3pDqtADUhQJ/OEVTbw7T6pXMA==
X-Received: by 2002:a62:5982:: with SMTP id k2-v6mr374621pfj.180.1540934590326;
	Tue, 30 Oct 2018 14:23:10 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b2-v6sm207856pgh.85.2018.10.30.14.23.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 14:23:09 -0700 (PDT)
Date: Tue, 30 Oct 2018 14:22:49 -0700
Message-Id: <20181030212249.7117-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181030212249.7117-1-palmer@sifive.com>
References: <20181030212249.7117-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-riscv] [PULL 3/3] Add qemu-riscv@nongnu.org as the RISC-V list
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 21:23:13 -0000

We now have a RISC-V specific QEMU development list.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d550fd8b809c..10983bd52d64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -244,6 +244,7 @@ M: Palmer Dabbelt <palmer@sifive.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+L: qemu-riscv@nongnu.org
 S: Maintained
 F: target/riscv/
 F: hw/riscv/
-- 
2.18.1


