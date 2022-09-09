Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeH6-00074P-Bc
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH2-0006x2-71; Fri, 09 Sep 2022 09:42:24 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH0-0003GI-Gu; Fri, 09 Sep 2022 09:42:23 -0400
Received: by mail-pf1-x430.google.com with SMTP id e5so1712568pfl.2;
 Fri, 09 Sep 2022 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0NiTrMcvg+oQAfKwWrT9F0nxen0MKb9Zo7O/5cgyVx8=;
 b=F5LqMe1Mt56QeB/jCMXj5HGSLWh6r6sl+te2HfIo4m1DVVDfwEDS8a4itUbutX89fE
 siKiQu4OWSiRV3HimfHqbulwym+OwMFWfivkC489DFl0VznD5tJsaup2mu3UVodWIRzS
 dURUlDt6frVAVx0C5x+DzlY6c7HegUJDmqe7l+MtdCQ13Q7VOl+B/+bJ6cNmd5TUZjWg
 CqwchlR0dgOYgaCWnAZx9++Jh/XWbHryTFdvjuCRAc6FBdWRvUFWxFmsxyeDtdaSNOnj
 q3ge0SwDUhWwA6gnv+D/TXiQzhd1x6sEQryTdg6y2iUn8G4PqlkPwPw3Tn6vkmA4mMr0
 l5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0NiTrMcvg+oQAfKwWrT9F0nxen0MKb9Zo7O/5cgyVx8=;
 b=xkUzZeHbRgB+sXZilYiXqPocw5/vkVYt0Lal03dT/TMlMkz/CayO9Yr39QGKIQBXTI
 hGhWw8I+oiKyGrTosSqv/i3y4aMiDVyjqqLPycMcIEQenL8VsMhJEq/aapUf4KmM43J7
 d1JkfkH6ba5EkxcEbUB2m4nLJ/a5Iulf++ARx4KJGvUNa6ekvcml0mDW41obTO46ZlwX
 66ssX4E5xvXOM9+Mfb+rB1W3bUZOklcrKOQIIpaTxmMcyCfvefzMCoLSApqraEa+kjou
 oXaomRhO+uxee4Xjw+QuotOFQfJIhmkb5O8l3fD/lLN/VzNXD6PLE3T5mYLn4JjwFurX
 1sig==
X-Gm-Message-State: ACgBeo08zyKvmFzKEbw+uuKUiYhdA5ScFb2sx/i3Rnq8OKFYfM0QC4Ng
 iHbo2Iypa/6O4P9OOO9HKIGmbcqpUms=
X-Google-Smtp-Source: AA6agR6Jb/DkXyMB8+XpvjNPHaHYgRaMf24ZQzPK9g3wjZc1tW4XlRVtcmxJY2Vh38ZXwXiKkQuPHQ==
X-Received: by 2002:a62:84c6:0:b0:538:3c39:5819 with SMTP id
 k189-20020a6284c6000000b005383c395819mr14437959pfd.4.1662730940201; 
 Fri, 09 Sep 2022 06:42:20 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 0/8] target/riscv: Improve RISC-V Debug support
Date: Fri,  9 Sep 2022 21:42:07 +0800
Message-Id: <20220909134215.1843865-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:26 -0000

This patchset refactors RISC-V Debug support to allow more types of
triggers to be extended.

The initial support of type 6 trigger, which is similar to type 2
trigger with additional functionality, is also introduced in this
patchset.

This is a v2 respin of previous patch originally done by Frank Chang
at SiFive. I've incorperated my review comments in v2 and rebased
against QEMU mainline.

Changes in v2:
- fixed MXL_RV128 case
- moved macros to patch#2
- added log guest errors for TRIGGER_TYPE_{NO_EXIST,UNAVAIL}
- moved RV{32,64}_DATA_MASK definition to this patch
- add handling of the DBG_ACTION_NONE case in do_trigger_action()
- drop patch: "target/riscv: debug: Return 0 if previous value written to tselect >= number of triggers"

Frank Chang (8):
  target/riscv: debug: Determine the trigger type from tdata1.type
  target/riscv: debug: Introduce build_tdata1() to build tdata1 register
    content
  target/riscv: debug: Introduce tdata1, tdata2, and tdata3 CSRs
  target/riscv: debug: Restrict the range of tselect value can be
    written
  target/riscv: debug: Introduce tinfo CSR
  target/riscv: debug: Create common trigger actions function
  target/riscv: debug: Check VU/VS modes for type 2 trigger
  target/riscv: debug: Add initial support of type 6 trigger

 target/riscv/cpu.h      |   6 +-
 target/riscv/cpu_bits.h |   1 +
 target/riscv/debug.h    |  55 +++--
 target/riscv/csr.c      |  10 +-
 target/riscv/debug.c    | 484 ++++++++++++++++++++++++++++++++--------
 target/riscv/machine.c  |  20 +-
 6 files changed, 445 insertions(+), 131 deletions(-)

-- 
2.34.1


