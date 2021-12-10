Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZA-0002AD-6T
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZ8-00029x-Di
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:43:38 -0500
Received: from [2607:f8b0:4864:20::536] (port=39721
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZ6-0007pQ-59
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:43:37 -0500
Received: by mail-pg1-x536.google.com with SMTP id r5so7356621pgi.6
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kTvaMGold7nK22Vtdg40hzt8dArwbjIZtLkagnScic=;
 b=OXCCRS6iDa4aDIIeyHziQgp/Hx+HdmaRq5bGqKubquMDya5ws/CPmNF1t5H4uk84yr
 GnZge/fYkPoWJnoTWlnmEJMOO5iyCHRxRtBtuffj3Dos0tOs5tTWEov4B/YCSHyO3MWy
 6GJMK2pntLpfOcu7G5Y/dVwfj2AUC67PHSCUVqy8m8pQacg1e+4XftUaP+4AeNf3vi//
 iUXNj31KkQHPywYbJWyIPz2lrUj+JElS1A0M+zaXPqXHBnyqLQi92+vhWzaWQCViyKQC
 Wer3APZuBCw4K81aH+2iXymR/midAl9LruF50DgQNscrZaJTem9C4JG7ykQOfMaRkt+d
 abwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kTvaMGold7nK22Vtdg40hzt8dArwbjIZtLkagnScic=;
 b=W1epgbjERbG1FzCTxXZ3KP5/xhIw+ceidZqmyjmXQdsT+J9/C53x5KppfjlNIVjpaa
 H4ADKDKUENw3tnzEw+7vhwdq+gJqMX6rzk5xOESemM+VAayVSZSu6Zqxi5pdlUt/8YDN
 Np/gDv+3+dCUEuDf9i224LEdLurh7kSozvYcQwwcw+AJORjS2yUfLnMgxlZlXqBp7sVn
 USAmYCybCPoST4z8LUS7Enqxg3zEQCottBLkOHQQ0jyDSK08BEm7z4U1k43Q7DMWWjOa
 keYxd0pToPeqyOdmITCpT1BdMIsrslRtj45EZjaW4X937o94oNDSkszkiYuvVhr96l1e
 j7Kg==
X-Gm-Message-State: AOAM531XQqQcUl8xT9mmheoB57Oi1qqvcnuQU8h5x6iM203eapOs7pX0
 rRVs1lCaiwj3P1ufRuGadyNJtqipA7a1kiDS
X-Google-Smtp-Source: ABdhPJzlltgub8N10iz+xw1UaA18Gd4fpwVBGzuTJsgDE7n2wc7oBwU3Oki1/yXrP79rv+iFz6cHXg==
X-Received: by 2002:a62:780f:0:b0:4ac:df3f:dad4 with SMTP id
 t15-20020a62780f000000b004acdf3fdad4mr16562221pfc.14.1639122213583; 
 Thu, 09 Dec 2021 23:43:33 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Fri, 10 Dec 2021 15:43:19 +0800
Message-Id: <20211210074329.5775-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:43:38 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v6

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v6:
  * Rebase on riscv-to-apply.next.

v5:
  * Rebase on riscv-to-apply.next.

v4:
  * Spilt Zfh, Zfhmin cpu properties related changes into individual
    patches.

v3:
  * Use the renamed softfloat min/max APIs: *_minimum_number()
    and *_maximum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.
  * Add braces for if statements in REQUIRE_ZFH() and
    REQUIRE_ZFH_OR_ZFHMIN().
  * Rearrange the positions of Zfh and Zfhmin cpu properties.

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>

Frank Chang (3):
  target/riscv: zfh: add Zfh cpu property
  target/riscv: zfh: implement zfhmin extension
  target/riscv: zfh: add Zfhmin cpu property

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 824 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.31.1


