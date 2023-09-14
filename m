Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F8EDE98F
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qghOJ-0001Ls-DE; Thu, 14 Sep 2023 04:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOG-0001KZ-PG; Thu, 14 Sep 2023 04:07:56 -0400
Received: from forward100b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOC-0006bY-0z; Thu, 14 Sep 2023 04:07:56 -0400
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:9396:0:640:dd2a:0])
 by forward100b.mail.yandex.net (Yandex) with ESMTP id AEFE16011B;
 Thu, 14 Sep 2023 11:07:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id e7bUnJIDWmI0-IoemQWCy; 
 Thu, 14 Sep 2023 11:07:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1694678862; bh=YffXOR8/pU98jYze630tcD97bX9Dr0NEo3XPewdEIJA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=opru8xFPpQAC7ILPEc8+pdCm0ncwF3UF2tq9+Q3VsVGP2DZEsdVVOBdRbuE/QkSKG
 cEMvRU+3wpYQRGBHBoqfYQoVbGns5xFD8DloQTJyxH5l+B/HfEXfXb0sPnkJRSQCw0
 +zQEDxA4a/pMDFYsfiBtbz4+YV2t4ysdiNygCTrM=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/2] hw/riscv: hart: allow other cpu instance
Date: Thu, 14 Sep 2023 11:07:38 +0300
Message-Id: <20230914080740.7561-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:d100;
 envelope-from=nikita.shubin@maquefel.me; helo=forward100b.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Nikita Shubin <n.shubin@yadro.com>

Currently it is not possible to overload instance of RISCVCPU, 
i.e. something like this:

static const TypeInfo riscv_cpu_type_infos[] = {
     {
        .name = TYPE_ANOTHER_RISCV_CPU,
        .parent = TYPE_RISCV_CPU,
        .instance_size = sizeof(MyCPUState),
        .instance_init = riscv_my_cpu_init,
    }
};

Because we have RISCVHartArrayState.harts with exactly 
the size of RISCVCPU.

Using own instances can be used to store some internal hart state.

Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Link: https://patchwork.kernel.org/project/qemu-devel/patch/20230727080545.7908-1-nikita.shubin@maquefel.me/

Nikita Shubin (2):
  hw/riscv: hart: replace array access with qemu_get_cpu()
  hw/riscv: hart: allow other cpu instance

 hw/riscv/boot.c               |  6 ++++--
 hw/riscv/riscv_hart.c         | 20 ++++++++++++--------
 hw/riscv/sifive_u.c           |  7 +++++--
 hw/riscv/spike.c              | 17 ++++++++++-------
 hw/riscv/virt-acpi-build.c    |  2 +-
 hw/riscv/virt.c               | 17 +++++++++--------
 include/hw/riscv/riscv_hart.h |  2 +-
 7 files changed, 42 insertions(+), 29 deletions(-)

-- 
2.39.2


