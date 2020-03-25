Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYL-0000Np-3u
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYH-0000IB-GM
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYG-0008SX-G5
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:57 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYA-0008Nf-88; Wed, 25 Mar 2020 15:18:50 -0400
Received: by mail-wm1-x341.google.com with SMTP id d1so4187603wmb.2;
 Wed, 25 Mar 2020 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoRbPRQndAjunHQwtJ4X53lQZ94h16lYfKXNqfhYyaI=;
 b=awrkhuG/pWzJtErXTxcoiHf+78bzY7DFIHrCCsEqiJ5gjPeUD+8XvTRtHauXir3hA9
 seak2eHWP+wnXU4zswu6rQwVk5DeqUyjSbq7jUaDTZjpBIGwIcca6lSAM4UViRx8hn3c
 J1M8DfWVmfXtIqEpEtR1wpRdW54ds7PmJn/j6cUdvI0m/YCMn9ui6/jl36lD76oD/2NT
 C+8arVhqR9egZHX5cmMQwKTdQPkMj94XsL9MqRMiL6gSodxRA+hMBlKHTuKeuEKa+oXQ
 MW2mWkWxATf02YMa39pemmQ8iz+E7n3PghETNKKCP209DEmrfl6TVh1Wdhhsbql//mdJ
 8xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PoRbPRQndAjunHQwtJ4X53lQZ94h16lYfKXNqfhYyaI=;
 b=bEVumGahRoCR3jOIJvqlKtwSOSEN8uOvriP8KyM5cdq7uj+OXfqIZ9lFZ/0Wfgmu8p
 lLOTEwdruh+nsbZNoYTVvi64qatxEhBQX7hmwUYL9raqLhR1ayUJs4XNgouGPVOW/y3p
 BpTI4I3L9sby5UYCpg8kV5XOu1sE0VQXU6UMDYevjhUVRlrPttoxlFW597/UdbG4e42B
 jvWCiwMUIolttivj3ED2yVyDlttZfhaInCwO90Fwws1dP4OsTeIQevVNxQ6/3Mc3FhGR
 5k4dZZ76J92Z9fhUPUIDA492da7UbGv5IzEW8s75LEvZZJvPjA8ILd+6bofoXlSdRw0r
 yk/Q==
X-Gm-Message-State: ANhLgQ2x35YICMTGkrPMhBPNBBIKHIfqgMOcoI6P5b631I1ga0qREhMc
 x0xROIEFiWtW4vKvVMCHagFPJyI5+ak=
X-Google-Smtp-Source: ADFU+vvHnA/hgAHWUQOaerlLb4ew+FS4W4JbCX72YBWHquXPt9jiUTP/k6NJAZhNl0a0RqSSy9Ug2g==
X-Received: by 2002:a1c:721a:: with SMTP id n26mr4992757wmc.25.1585163929104; 
 Wed, 25 Mar 2020 12:18:49 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.0 05/12] hw/i386/x86: Add missing error-propagation code
Date: Wed, 25 Mar 2020 20:18:23 +0100
Message-Id: <20200325191830.16553-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Wed, 25 Mar 2020 19:19:00 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 87b73fe33c..0a4865d4a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -103,13 +103,17 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
     Object *cpu = NULL;
     Error *local_err = NULL;
 
     cpu = object_new(MACHINE(x86ms)->cpu_type);
 
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(cpu, true, "realized", &local_err);
 
     object_unref(cpu);
     error_propagate(errp, local_err);
 }
-- 
2.21.1


