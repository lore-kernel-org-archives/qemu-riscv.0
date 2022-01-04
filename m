Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4dPJ-0000dR-0y
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 01:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPH-0000dG-1X
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 01:34:51 -0500
Received: from [2607:f8b0:4864:20::635] (port=34815
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPF-0002Ub-DH
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 01:34:50 -0500
Received: by mail-pl1-x635.google.com with SMTP id x15so26431412plg.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jan 2022 22:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UeSn0dbESoAzrd+TOYprg0qBeWqMnFyOG4fspACOBbs=;
 b=WBLfu75xUDLCrmiSW6pXUPDAScDhwCusaN9r9eVth1M9GCzsgWzQWm0LbDiF0uAHoj
 OFMNe7pFCuARxqgnhXqIG0V1CRALE68WIZaX9Lgwrj+SDE8QZf3bQZvpDmwKJpKfuN/c
 ME45n6B9L8GL+FNt5zd3XI/iXnBgs3vPUntCVZ6WtXMcC6Ec/gPylIWGYkIYz0FLoueW
 cHB7IeZX57/X++dqC1bCE1CBX1i1D1TxXiZMv4j/5qkCnEzNQIy5N1wNAihY15bZ1o3z
 it43yIH8bPHQSYMqdyMrEft9quBscZ73vSnN+cfSIpPPNYFuu5WIYITdNU6+edGQhB47
 6bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UeSn0dbESoAzrd+TOYprg0qBeWqMnFyOG4fspACOBbs=;
 b=KHIDYPew+jlToBPXgp1XpYqaBMOLJPJ8l2GTsTPEuy5y328RwtNuL8i82QK2Bi98T7
 mOvdlOTCNPNLt/llRjePqpGB+z85iAVTBMI19knUPJU6sy262D4ylFOpfOfCkDa5nAl8
 RQTr2Bzd/cITuWvLqyUG2vHZq+mRl/uX6veCNHVoH8IEZnQ0KYAjSKZQ51YMzAVU34/J
 vjP5ljqJLVLh42Z94ufRJ4yGta77o4/ccmqY2nM48C0CT/BLNxANhhXpmImyrXwmdiOT
 M5BB/lR+qSLU3LkofgOT4uwthgd3QJHPOz40R6xEvuu8IyNZKYw5uFCHA5d06BUN3Z9o
 7ocA==
X-Gm-Message-State: AOAM533b2SMb/Bzt5BprpTkhgS8okXKNBXVg8+o1YGj4hZuhJVMAN9dQ
 GseIXWIJXSLXLdjXtqgSvWEc6w==
X-Google-Smtp-Source: ABdhPJw3DGYG0Z4KfW3ai4Vwf2uq3Tkl2p9PV/qwbAEKws5xnx026fi99GWqsGv9k3PcnQBKpfI8dA==
X-Received: by 2002:a17:902:d2d2:b0:149:1273:6f68 with SMTP id
 n18-20020a170902d2d200b0014912736f68mr47394899plc.37.1641278087823; 
 Mon, 03 Jan 2022 22:34:47 -0800 (PST)
Received: from jimshu-VirtualBox.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b65sm39371533pfg.209.2022.01.03.22.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 22:34:47 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 0/2] Align SiFive PDMA behavior to real hardware
Date: Tue,  4 Jan 2022 14:34:06 +0800
Message-Id: <20220104063408.658169-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 04 Jan 2022 06:34:51 -0000

HiFive Unmatched PDMA supports high/low 32-bit access of 64-bit
register, but QEMU emulation supports low part access now. Enhance QEMU
emulation to support high 32-bit access. 

Also, permit 4/8-byte valid access in PDMA as we have verified 32/64-bit
accesses of PDMA registers are supported.

Changelog:

v2:
  * Fix high 32-bit write access of 64-bit RO registers
  * Fix commit log

Jim Shu (2):
  hw/dma: sifive_pdma: support high 32-bit access of 64-bit register
  hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA registers

 hw/dma/sifive_pdma.c | 181 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 159 insertions(+), 22 deletions(-)

-- 
2.25.1


