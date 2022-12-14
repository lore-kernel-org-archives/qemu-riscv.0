Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5Yz4-0002H3-Tr
	for mharc-qemu-riscv@gnu.org; Wed, 14 Dec 2022 16:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p5WZl-0006hE-2n; Wed, 14 Dec 2022 13:33:53 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p5WZj-00006r-1g; Wed, 14 Dec 2022 13:33:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B117AB81983;
 Wed, 14 Dec 2022 18:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B450EC433D2;
 Wed, 14 Dec 2022 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671042818;
 bh=2SkFsGelbuSuJsr1fP0T+Hw575WHimSL2WBJpV2nv4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hdd+baafq7tPQKDo+par+JeVlI2WCG0vgaWZeUI6qIWIBebOPn8pYZRXbY1WwPlWX
 KVhcXcgr3IsjEgZ8TtmW709FzwMO6JRX1hGwQLa/hijMRf0hm3ibCocBSgamvull+f
 7ij6IMFehOyrYIvZ32wqp1vbXp1St3Wa1eKby5sN/Qj2+ATQgSJeh7QrJsK1+TS/9J
 7/Ov4Ph3gUh2sEtmbMk4+Hi6aIf+RquIMaxYIU4oxJyyD7ASomWJ0aoAIO7iUymCYT
 eTgBiGljQG6GKQLZ2Wt8D8gIOiCI/Kqo2U6d9lqffVdLUtAh+Lcrcf5DVA+4vICkOX
 2DVskaYjqJ/dQ==
Date: Wed, 14 Dec 2022 11:33:35 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 4/4] hw/nvme: fix missing cq eventidx update
Message-ID: <Y5oW/xugU1Qf0u5E@kbusch-mbp.dhcp.thefacebook.com>
References: <20221212114409.34972-1-its@irrelevant.dk>
 <20221212114409.34972-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212114409.34972-5-its@irrelevant.dk>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Dec 2022 16:08:09 -0500
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
X-List-Received-Date: Wed, 14 Dec 2022 18:33:53 -0000

On Mon, Dec 12, 2022 at 12:44:09PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to reading the shadow doorbell cq head, we have to update the
> eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
> write. This happens on riscv64, as reported by Guenter.
> 
> Adding the missing update to the cq eventidx fixes the issue.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Cc: qemu-stable@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>


Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

