Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYbPc-0000G6-LF
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 17:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lYbPb-0000Fm-8r; Mon, 19 Apr 2021 17:26:31 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:21190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lYbPV-0004Yx-TP; Mon, 19 Apr 2021 17:26:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618867575; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=kpDk7Ai/90MPX04nI0/09mLb88ZDXe3lVd4FkcWd1cOXEG4gZrGZ5TG/u5+lE9pGD3
 xVJsBi337M9qd3eT0nk3vPzUWwTRW+DjP4quj6UFdoETKZb3hwkVWKmjQbnZ48SQwjOn
 w5qyLc5kbx7CUZPqpB6hS6Aawr0S9bTriF8GUK2dxCFTVudQ2vwEytkiRpMH/S2PpqQD
 hBVFl7VpqJx7TlgBv2KlzOZ5Nd+hBA72ujX72Epk8Q/Oqz1hchz846WoKOLlZhaH4VmU
 PC4Btn9GoObmRI3xXndCrgBO4+XQXolc2JkbXf8fHYlWRC5l+SdPIOAiAp1e9OPa7fIi
 F3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618867575;
 s=strato-dkim-0002; d=strato.com;
 h=Date:Message-ID:Subject:From:Cc:References:To:Cc:Date:From:Subject:
 Sender; bh=wxo1ovHERLm79wzEmHpOZuFSJ1XrUo6J+MTm/AhYyvM=;
 b=IYpcEGpn7mcmkfMhu8tf88nQMPeeSdHh/qAsUkquvad/W6Cay+PEWoZ2MBc9Tw7zP+
 +D/bXJ9rOiZd5EXRDdGwJquwZDAVIQbHvNLyhhRVxU357BSOuijyQEwzeQjQEIMRXst4
 7KFwnOBZq1eFQlnYjqjbn6qrXFaYsajZOl6Xm+ybN0PVD/3xQKCEtFc1EHds/RFH0ynG
 Ko381YtlG7zsiN1wfun3ir1fXqund37LhddHtjdPScJGxG/9pJIZhIdXdZCmlevgSr3p
 an+2yNd3pqdnlqJwV711+ZVc1AdLciawncguMH8JsfOGTeuOhgoJNhFcLhCHC7znXuAT
 xXlA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JSSHyzkN3ON0Uun6F+zrkVqc/ZmTClqC4x8TtiRZHkgvdiKE9vpOcNvUp/CcHtmvnEw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c3:9710:2300:1761:34f8:11a8:6e99]
 by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id U051a9x3JLQEGfh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 19 Apr 2021 23:26:14 +0200 (CEST)
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: 
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
From: Alexander Wagner <alexander.wagner@ulal.de>
Subject: Re: [PATCH] hw/riscv: Fix OT IBEX reset vector
Message-ID: <59b1b2ac-dd6a-46aa-9b48-6afa7eb41c0a@ulal.de>
Date: Mon, 19 Apr 2021 23:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Received-SPF: none client-ip=81.169.146.219;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Apr 2021 21:26:31 -0000

Hi,

I just wanted to check if the patch [1] is missing anything to be=20
merged? If so, please let me know.

Regards

Alex


[1]=20
https://patchew.org/QEMU/20210310221208.167990-1-alexander.wagner@ulal.de=
/



