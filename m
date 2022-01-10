Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6n2j-0008Bu-Gf
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 00:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6n2f-0008AE-Jg
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 00:16:26 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6n2c-0002yS-Mn
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 00:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641791781; x=1673327781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cv2ZUuGwiGunwBJ79b+awlep6CGPwh33SMQrtYKqgJE=;
 b=TDrlHU5w44Dk/WBr9w6Qcg5fRFgekIg5eA0g2jzxQneyE7mX/HoYSPRM
 qFHOUxYj+F0om9v+acEogHVeuwWkvdTfX6UAiX6zM4aSNDXnkTWVuFb2+
 XHB5NCmlBsSzvQfwvHwXwhOq80Fd+iJRl7y0IRfMhQjfzTzrl9rcm+vwL
 NZvUi5qWudQgV2s0ocCjCSCyPMhXt8r9yw07zseiSSfunTrG9iTr47ar/
 KIgqte3o3W6o+z1YQzlYO66NBRatXi6TLXKj/ZZzMO1VxuA+nxy2KbJDE
 OSw87T84LDUiKHXG9YbYfopD33qDkoGtDuQr60udJyhX9T5/9yWqLNayN g==;
X-IronPort-AV: E=Sophos;i="5.88,276,1635177600"; d="scan'208";a="190071097"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2022 13:16:18 +0800
IronPort-SDR: /Fw4SdhwxlxBu214TgzyLjT21jN5kMECID/tSi9Kf3QhOyZBCPNzHEiJ0VlEyXp19ZNliJcqsb
 B9Ms7s/O0G5EdNhHna3kqTHRbll2I1V6em+L6OxmBI1Kgocp2aL6SMxeChfPycYh7tSwy4gIQH
 sv4kkxGBCGyPj+RYnLxjzamL0TtAUXq/qCm//WSAGUFwu0aI63slgmFMxJBcWoqR7uytxyuWXD
 atqSbvh9OyB/8f8nFS1mg0qLfKNOFLp6njGsczqZzHi+nlBMB0OxOAcowUqiWQCugi6gufgm78
 0UslVhsm5JIBE9peypajMwfS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:48:43 -0800
IronPort-SDR: DsmrRhzblCs7tKnDPM105XzFIr9M1WeYdabwzbrINC/iIJ34ldtA3qcbKQ4N6u9wzj5PTndlqm
 OxOHVZyOJw9WCZ1lor3Szl3vZmwfpcZ7lGj9GDtzOxrb930b+Z3cw97vZADnEQSt5ir+hyqBWM
 Aw1GL7BvJxakWGsqgWva3preZuAXzMu9qejWmbcWgTX0Unmp1e+sWqOH9Bsl8nnvqC3xTDmHNu
 vEQBo47wu/VG4E9GPH0mzFlxQkd3HrQwiap5Y8Wo2+bjqMv7YzA5rc/vN5cCdkqKRM0L6anBrC
 Ez4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 21:16:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JXMVp62Tbz1VSm2
 for <qemu-riscv@nongnu.org>; Sun,  9 Jan 2022 21:16:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1641791778;
 x=1644383779; bh=Cv2ZUuGwiGunwBJ79b+awlep6CGPwh33SMQrtYKqgJE=; b=
 SmKEwimQEmRi5GXtjNDwgH6MAkzP0kE0QP3qMYPuR7LjTaC3ozYMN5pCXeIYvT4s
 7XHKr7PVKjdCFeYYzps8JgmNraWf08iLiLk/I3btVzkUZqBK3aG9sF6V0H6nRwsn
 l6Llrl7fiYjj+v+WsvbBEi40UlGUr4tMea4/QAYSWzc0NJEyndulPV+A+c5IQuyo
 R1y6EBIEdNIXhkneb0iIwurZpPH6HIbH9E2dVB0EtDRzgVtlgXV+xhheOaKPZEho
 IsoVNreN1Y8tQLZIKL7YOn+EqF/8zQvmAkzlcd1dJYdC9jG69dmKHjrmzS7xKfWG
 6rNjd2254kynjeUl9dE3dA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BBY00SqTHuoh for <qemu-riscv@nongnu.org>;
 Sun,  9 Jan 2022 21:16:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JXMVk0hQZz1VSkW;
 Sun,  9 Jan 2022 21:16:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH] hw: timer: ibex_timer: Fixup reading w/o register
Date: Mon, 10 Jan 2022 15:16:06 +1000
Message-Id: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=002fe4623=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 10 Jan 2022 05:16:27 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This change fixes a bug where a write only register is read.
As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
the 'INTR_TEST0' register is write only.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/timer/ibex_timer.c         | 14 +++++---------
 include/hw/timer/ibex_timer.h |  1 -
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 66e1f8e48c..826c38b653 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -130,7 +130,6 @@ static void ibex_timer_reset(DeviceState *dev)
     s->timer_compare_upper0 =3D 0xFFFFFFFF;
     s->timer_intr_enable =3D 0x00000000;
     s->timer_intr_state =3D 0x00000000;
-    s->timer_intr_test =3D 0x00000000;
=20
     ibex_timer_update_irqs(s);
 }
@@ -168,7 +167,8 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr =
addr,
         retvalue =3D s->timer_intr_state;
         break;
     case R_INTR_TEST:
-        retvalue =3D s->timer_intr_test;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Attempted to read INTR_TEST, a write only registe=
r");
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -215,10 +215,7 @@ static void ibex_timer_write(void *opaque, hwaddr ad=
dr,
         s->timer_intr_state &=3D ~val;
         break;
     case R_INTR_TEST:
-        s->timer_intr_test =3D val;
-        if (s->timer_intr_enable &
-            s->timer_intr_test &
-            R_INTR_ENABLE_IE_0_MASK) {
+        if (s->timer_intr_enable & val & R_INTR_ENABLE_IE_0_MASK) {
             s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
         }
@@ -247,8 +244,8 @@ static int ibex_timer_post_load(void *opaque, int ver=
sion_id)
=20
 static const VMStateDescription vmstate_ibex_timer =3D {
     .name =3D TYPE_IBEX_TIMER,
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .post_load =3D ibex_timer_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(timer_ctrl, IbexTimerState),
@@ -257,7 +254,6 @@ static const VMStateDescription vmstate_ibex_timer =3D=
 {
         VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
         VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
         VMSTATE_UINT32(timer_intr_state, IbexTimerState),
-        VMSTATE_UINT32(timer_intr_test, IbexTimerState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.=
h
index b6f69b38ee..1a0a28d5fa 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -43,7 +43,6 @@ struct IbexTimerState {
     uint32_t timer_compare_upper0;
     uint32_t timer_intr_enable;
     uint32_t timer_intr_state;
-    uint32_t timer_intr_test;
=20
     uint32_t timebase_freq;
=20
--=20
2.34.1


