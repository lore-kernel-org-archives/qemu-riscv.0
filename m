Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iTAFD-0000AW-0f
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 14:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iTAFA-00008v-3P
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iTAF9-0005zP-1b
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:28 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iTAF8-0005wZ-JF
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:26 -0500
Received: by mail-pg1-x543.google.com with SMTP id k13so4619570pgh.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=kXUfIwaLzekBgu4rO+8d58TXD+81bPyPI2S5oCzPGYs=;
 b=c0i/V82rl872oRDRzsNny1HZCiTCIFzzt34/kJGvhuWfp/u4Pojwib0Qj0Y1mz1PzT
 qfFU8q0hTw4m8desBU9Xg+C1pJH39AEfvaOOW4buCSWF1XBM2HiWYF6wnam/MuMdX4Dd
 Vj9mEAXPxl8zhK04wLxmxhQ/hcrCooDBCRuSrKT0d4RGs5VvQw0Ae2ALK2unR3/pSSf5
 zy8iJGYR992HIDa+xqa+PazYKMN/rDle7YcCo0w2YDJVCSMe59uDwPm/lU0egiinRk44
 GfDgux5drYFXQEzCqNZga54mnm5VdKXp155vD2nPkfzYDsZp/Vfj2Tg44rKHyv/w6HjC
 8YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=kXUfIwaLzekBgu4rO+8d58TXD+81bPyPI2S5oCzPGYs=;
 b=pX3lgimiprUdPsc5S5z2XgRXMWNk12fcB1HdejpwfCw01AQmoBRsAzAS/5FoHIdVX9
 pv6kIBT8qxX+IpOKJxOooL2KHXavinIJ5uJPt41xDC9Jt4Gry6DYV2b4u7rV6sbnx8U8
 iuJb/FllK4E9PPTmIXsZxqL0Y2aHHQfTtRsc1PI8xTQsYEJOG/biEdRWAxrjeVaUU1dM
 /9592b1HLIqQ8d9iA3qunzc9P2qK9YdLxLEJct1YCzyHD8Dc4lnwzuj0G/6245IXveBL
 1rIDUtDOp9ttNeW9lxa5OrckZtExTgX9I4p5hs6rhfB/nvsS/zFFniZ6WSe6jyZKI/49
 8Afg==
X-Gm-Message-State: APjAAAU6WIaBw+ArfPE5z2pIStDHGgGe3lmelRzP7wzao60ddAxicMui
 48UUBhwLRrzMmfxFLVYpSOHqO9rY/4I=
X-Google-Smtp-Source: APXvYqyO8pvXTpDi0TvMfvPWDtSTnfeh/2tIOLJK7JEiHeE41SJeRQ+aQhz25QSrx9lMGQ1k1TyYFQ==
X-Received: by 2002:a62:1841:: with SMTP id 62mr13763325pfy.108.1573242504332; 
 Fri, 08 Nov 2019 11:48:24 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y123sm7120494pfg.64.2019.11.08.11.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 11:48:23 -0800 (PST)
Subject: [PATCH v2 0/3] device_tree: Allow for and use string arrays [Was:
 RISC-V: virt: This is a "sifive, test1" test finisher]
Date: Fri,  8 Nov 2019 11:47:55 -0800
Message-Id: <20191108194758.17813-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Fri, 08 Nov 2019 19:48:29 -0000

Device trees commonly contain arrays of strings for compatible nodes.
We recently extended the "sifive,test0" node in a backwards-compatible
way, but QEMU didn't contain an FDT function to set 'compatible =
"sifive,test1", "sifive,test0";'.  I've converted over the code from the
ARM virt board that was doing something similar to be a helper function,
which I could then use for RISC-V as well.

I haven't tested the ARM change, but I have tested the RISC-V one.  It
appears to parse correctly in Linux, and a DTC treats it the same way as
it treats the string arrays it compiles -- specifically:

    $ cat test.dts
    /dts-v1/;

    / {
        string = "stringa";
        strings = "string1", "string2";
    };
    $ dtc -I dts test.dts -O dtb -o test.dtb
    $ dtc -I dtb test.dtb -O dts -o out.dts
    $ cat out.dts
    /dts-v1/;

    / {
            string = "stringa";
            strings = "string1\0string2";
    };

and

    $ qemu-system-riscv64 -m virt,dumpdtb=out.dtb ...
    $ dtc -I dtb test.dtb -O dts -o out.dts
    $ cat out.dts
    ...
            test@100000 {
                reg = <0x00 0x100000 0x00 0x1000>;
                compatible = "sifive,test1\0sifive,test0";
        };
    ...

Changes since v1 <20191107222500.8018-1-palmer@sifive.com>:

* This is now a multiple patch series.
* The hepler function has been added and used by the RISC-V virt board.
* The ARM virt board has been converted to use the helper function


